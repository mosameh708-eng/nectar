import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:nectar/auth/cubit/signup_cubit.dart';
import 'package:nectar/auth/log_in.dart';
import 'package:nectar/product_data/product_model.dart';
import 'package:nectar/root.dart';
import 'package:nectar/widgets/Custom_button.dart';
import 'package:nectar/widgets/custom_text_field.dart';
import '../widgets/custom_text.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var cubit = SignupCubit.get(context);
    return BlocConsumer<SignupCubit, SignupState>(
      listener: (context, state) {
        if (state is SignupSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Account created successfully"),
              backgroundColor: Colors.green,
            ),
          );
          ProductModel.setUser(usernameController.text, emailController.text);
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => Root(initialPage: 0, zone: ''),
            ),
          );
        }
        if (state is SignupError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("fail"), backgroundColor: Colors.green),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: Form(
            key: formkey,
            child: Column(
              children: [
                Gap(60),
                SvgPicture.asset("assets/svgs/Group.svg"),
                Gap(40),
                CustomText(text: "Sign Up", color: Colors.black, fontsize: 30),
                Gap(15),
                CustomText(
                  text: "Enter your credentials to continue",
                  color: Color(0xff7C7C7C),
                ),
                Gap(30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: CustomTextField(
                    controller: usernameController,
                    label: "Username",
                    ispassword: false,
                  ),
                ),
                Gap(30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: CustomTextField(
                    controller: emailController,
                    label: "Email",
                    ispassword: false,
                  ),
                ),
                Gap(30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: CustomTextField(
                    controller: passController,
                    label: "Password",
                    ispassword: true,
                  ),
                ),
                Gap(30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: CustomButton(
                    title: "Sign Up",
                    onTap: () {
                      if (formkey.currentState!.validate()) {
                        cubit.SignUp(
                          usernameController.text,
                          emailController.text,
                          passController.text,
                        );
                      }
                    },
                    color: Color(0xff53B175),
                    svgs: false,
                    svg: "",
                    fontcolor: Colors.white,
                  ),
                ),
                Gap(15),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                      text: " Already have an account?",
                      color: Colors.black,
                    ),
                    Gap(5),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (c) => LogIn()),
                        );
                      },
                      child: CustomText(
                        text: "Login",
                        color: Color(0xff53B175),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
