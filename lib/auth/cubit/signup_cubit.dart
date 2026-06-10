import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:nectar/shared/constant.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit() : super(SignupInitial());
  static SignupCubit get(context)=>BlocProvider.of(context);
  final dio= Dio();
  Future<void> SignUp(String? name, String? email, String? password) async {
    emit(SignupLoading());
    try {
      final response = await dio.post(
        "$baseUrl/register",
        data: {
          "name": name,
          "email": email,
          "password": password,
        },
      );
      print("Signup response: $response");
      emit(SignupSuccess());
    } catch (e) {
      print("message response of signup $e");
      emit(SignupError(error: e.toString()));
    }
  }
}
