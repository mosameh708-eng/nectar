import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/src/widgets/editable_text.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:nectar/auth/sign_up.dart';
import 'package:nectar/shared/constant.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit() : super(SignupInitial());
  static SignupCubit get(context)=>BlocProvider.of(context);
  final dio= Dio();
  SignUp( String ?name,String ?email,String? password ){
    emit(SignupLoading());
    try{
      final response = dio.post("$baseUrl/register",
      data: {
        "name" : name,
        "email" :email,
        "password":password,
      }
      );
      emit(SignupSuccess());
      
    }catch(e){
      print("message response of signup $e");
      emit(SignupError(error: e.toString()));
    }
  }
}
