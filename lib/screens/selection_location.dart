import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:nectar/auth/log_in.dart';
import 'package:nectar/screens/shop.dart';
import 'package:nectar/widgets/Custom_button.dart';
import 'package:nectar/widgets/custom_navigate.dart';
import 'package:nectar/widgets/custom_text.dart';
import 'package:nectar/widgets/custom_text_field.dart';

class SelectionLocation extends StatefulWidget {
   SelectionLocation({super.key });
  @override
  State<SelectionLocation> createState() => _SelectionLocationState();
}

class _SelectionLocationState extends State<SelectionLocation> {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  TextEditingController zonecontroller = TextEditingController();
  List  zones = [
    "Cairo",
    "Alexandria",
    "Port Saied",
    "Ismailia",
    "Suez"
        "Tanta",
    "Menofia",
    "Banha",
    "Luxor",
    "Aswan",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            CustomNavigate(),
            Gap(30),
            Image.asset(
              "assets/logo/illustration.png",
              width: 220,
              height: 170,
            ),
            Gap(30),
            CustomText(text: "Select Your Location", color: Color(0xff181725)),
            CustomText(
              text:
                  "Switch on your location to stay in tune with\nwhat’s happening in your area",
              color: Color(0xff7C7C7C),
            ),
            Gap(100),
          Form(
            key: formkey,
            child: GestureDetector(
              onTap: (){
                setState(() {
                  ListView.builder(itemCount: zones.length,itemBuilder:(context,index){
                    setState(() {
                      zonecontroller.text =zones[index];
                    });
                  } );
                });
                },
              child: TextField(
                controller: zonecontroller,
                decoration: InputDecoration(
                  label: CustomText(text: "Your Zone", color: Color(0xff7C7C7C)),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.grey),
                       ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: const BorderSide(color: Colors.black),
                       ),
                     ),
                   ),
            ),
          ),
            Gap(60),
            CustomButton(
              title: "Submit",
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (c)=>Shop(zones: zonecontroller.text)));
                },
              color: Color(0xff53B175),
              svgs: false,
              svg: "",
              fontcolor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}


