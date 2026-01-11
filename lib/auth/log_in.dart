import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:nectar/auth/cubit1/login_cubit.dart';
import 'package:nectar/root.dart';
import 'package:nectar/auth/sign_up.dart';
import 'package:nectar/screens/shop.dart';
import 'package:nectar/widgets/Custom_button.dart';
import 'package:nectar/widgets/custom_text.dart';
import 'package:nectar/widgets/custom_text_field.dart';


class LogIn extends StatefulWidget {
  const LogIn({super.key});


  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    var cubit = LoginCubit.get(context);
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if(state is LoginError){
          print("no");
        }
        if(state is LoginSuccess){
          print("Success");
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Success"),
              backgroundColor: Colors.green,
            ),
          );
        }
          Navigator.push(context, MaterialPageRoute(builder: (c)=>Shop(zones: '',)));
      },
      builder: (context, state) {
        return Scaffold(
          body: Form(
            key: formkey,
            child: Column(
              children: [
                Gap(20),
                SvgPicture.asset("assets/svgs/Group.svg"),
                Gap(60),
                CustomText(text: "Log in", color: Colors.black, fontsize: 30),
                Gap(15),
                CustomText(
                  text: "Enter your emails and password",
                  color: Color(0xff7C7C7C),
                  fontsize: 18,
                ),
                Gap(30),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: CustomTextField(label: "Email", ispassword: false,),
                ),
                Gap(20),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: CustomTextField(
                    label: "Password", ispassword: true,),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: CustomText(
                        text: "Forgot Password?", color: Colors.black),
                  ),
                ),
                Gap(10),
                CustomButton(
                  title: "Log In",
                  onTap: () {
                    if(formkey.currentState!.validate()){
                      cubit.LogIn(
                          emailcontroller.text,
                          passwordcontroller.text,
                      );

                    }
                  },
                  color: Color(0xff53B175),
                  svgs: false,
                  svg: "",
                  fontcolor: Colors.white,
                ),
                Gap(15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                        text: "Don’t have an account?", color: Colors.black),
                    Gap(5),
                    GestureDetector(
                      onTap: () =>
                          Navigator.push(context, MaterialPageRoute(builder: (c) => SignUp())),
                      child: CustomText(text: "Signup", color: Color(0xff53B175)),
                    ),


          ]),
              ],
            ),
          ),
        );
      },
    );
  }
}
