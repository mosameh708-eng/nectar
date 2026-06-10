import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:nectar/shared/constant.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  static LoginCubit get(context)=>BlocProvider.of(context);
  final dio=Dio();
  Future<void> LogIn(String? email, String? password) async {
    emit(LoginLoading());
    try {
      final response = await dio.post(
        "$baseUrl/login",
        data: {
          'email': email,
          'password': password,
        },
      );
      print("Message of the response $response");
      emit(LoginSuccess());
    } catch (e) {
      print("Message of the response $e");
      emit(LoginError(error: e.toString()));
    }
  }
}
