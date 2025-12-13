import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:nectar/auth/log_in.dart';
import 'package:nectar/widgets/Custom_button.dart';
import 'package:nectar/widgets/custom_text_field.dart';
import 'package:bloc/bloc.dart';
import '../widgets/custom_text.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  TextEditingController emailController =TextEditingController();
  TextEditingController passController =TextEditingController();
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formkey,
        child: Column(
          children: [
            Gap(20),
            SvgPicture.asset("assets/svgs/Group.svg"),
            Gap(60),
            CustomText(text: "Sign Up", color: Colors.black, fontsize: 30),
            Gap(15),
            CustomText(
              text: "Enter your credentials to continue",
              color: Color(0xff7C7C7C),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: CustomTextField(label: "Username", ispassword: false,),
            ),
            Gap(30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: CustomTextField(label: "Email", ispassword: false,),
            ),
            Gap(30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: CustomTextField(label: "Password", ispassword: true,),
            ),
            Gap(30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                children: [
                  CustomText(
                    text:
                    "By continuing you agree to our ",
                    color: Colors.grey,
                  ),
                  CustomText(
                    text:
                    "Terms of Services ",
                    color: Color(0xff53B175),
                  ),
                  CustomText(
                    text:
                    "and",
                    color: Colors.grey,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: CustomText(
                  text:
                  "Privacy Policy",
                  color: Color(0xff53B175),
                ),
              ),
            ),
            Gap(30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: CustomButton(
                title: "Sign Up",
                onTap: () {},
                color: Color(0xff53B175),
                svgs: false,
                svg: "", fontcolor: Colors.white,
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
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (c) => LogIn()),
                  ),
                  child: CustomText(text: "LogIn", color: Color(0xff53B175)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
