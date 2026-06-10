import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repositories/auth_repository.dart';
import '../../repositories/storage_repository.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository authRepository;
  final StorageRepository storageRepository;

  AuthCubit({
    required this.authRepository,
    required this.storageRepository,
  }) : super(const AuthState()) {
    _loadSavedUser();
  }

  Future<void> login({
    required String email,
    required String password,
  }) async {
    emit(state.copyWith(status: AuthStatus.loading, errorMessage: null));
    try {
      final user = await authRepository.login(email: email, password: password);
      await storageRepository.saveUser(user);
      emit(state.copyWith(status: AuthStatus.authenticated, user: user));
    } catch (error) {
      emit(state.copyWith(
        status: AuthStatus.error,
        errorMessage: error.toString().replaceFirst('Exception: ', ''),
      ));
      emit(state.copyWith(status: AuthStatus.initial));
    }
  }

  Future<void> register({
    required String name,
    required String email,
    required String password,
  }) async {
    emit(state.copyWith(status: AuthStatus.loading, errorMessage: null));
    try {
      final user = await authRepository.register(
        name: name,
        email: email,
        password: password,
      );
      await storageRepository.saveUser(user);
      emit(state.copyWith(status: AuthStatus.authenticated, user: user));
    } catch (error) {
      emit(state.copyWith(
        status: AuthStatus.error,
        errorMessage: error.toString().replaceFirst('Exception: ', ''),
      ));
      emit(state.copyWith(status: AuthStatus.initial));
    }
  }

  Future<void> logout() async {
    await storageRepository.clearUser();
    emit(const AuthState());
  }

  Future<void> _loadSavedUser() async {
    final savedUser = await storageRepository.loadUser();
    if (savedUser != null) {
      emit(state.copyWith(status: AuthStatus.authenticated, user: savedUser));
    }
  }
}
