import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:nectar/auth/log_in.dart';
import 'package:nectar/widgets/Custom_button.dart';
import 'package:nectar/widgets/custom_text.dart';


class OnBording extends StatelessWidget {
  const OnBording({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: SizedBox(
              width: double.infinity,
               child: Image.asset("assets/logo/8140 1.png",fit: BoxFit.fill,),
            ),
          ),
          Column(
           children: [
             Gap(360),
             Align(
               alignment: Alignment.center,
                 child: Image.asset("assets/logo/Group.png",)),
             Gap(10),
             CustomText(text: "Welcome",color: Colors.white,fontsize: 40,),
             CustomText(text: "to our store",color: Colors.white,fontsize: 40,),
             CustomText(text: "Ger your groceries in as fast as one hour",color: Colors.grey,),
             Gap(15),
             CustomButton(
               title: "Get Started",
               color: Color(0xff53B175),
               svgs: false,
               svg: '',
               onTap: (){
                   Navigator.push(context, MaterialPageRoute(builder: (c)=>LogIn()));
               },
               fontcolor: Colors.white,
             ),





           ],
          )


            ],
          ),



       
    );
  }
}
