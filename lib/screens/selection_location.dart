import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:nectar/auth/log_in.dart';
import 'package:nectar/widgets/Custom_button.dart';
import 'package:nectar/widgets/custom_dropdown.dart';
import 'package:nectar/widgets/custom_navigate.dart';
import 'package:nectar/widgets/custom_text.dart';

class SelectionLocation extends StatelessWidget {
  const SelectionLocation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
              children: [
                CustomNavigate(),
                Gap(30),
                Image.asset("assets/logo/illustration.png",width: 220,height: 170,),
                Gap(30),
                CustomText(text: "Select Your Location", color: Color(0xff181725)),
                CustomText(text: "Switch on your location to stay in tune with\nwhat’s happening in your area", color: Color(0xff7C7C7C)),
                Gap(10),
                
                Gap(30),
                CustomButton(title: "Submit", onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (c)=>LogIn()));
                }, color: Color(0xff53B175), svgs: false, svg: "", fontcolor: Colors.white,),


              ]),
        ));
  }
}
