import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:nectar/screens/Beverages.dart';
import 'package:nectar/widgets/custom_search_text_field.dart';
import 'package:nectar/widgets/custom_text.dart';

class Explore extends StatelessWidget {
  const Explore({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Gap(30),

              CustomText(text: "Find Products", color: Colors.black,fontsize: 24,),
              Gap(20),
              
                  CustomSearchTextField(),
                  Gap(40),
                  SvgPicture.asset("assets/svgs/Group 6839.svg"),



              Gap(30),
            GridView.builder(
              padding: EdgeInsets.all(8),
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 8,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  childAspectRatio: 1.4,
                ),
                itemBuilder: (context, index) {
                  return  GestureDetector(
                      onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (c)=>Beverages())),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Container(
                          width: 70,height: 100,
                          decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.blue.shade200,
                              border: Border.all(
                                color: Colors.blue.shade100,
                              )
                          ),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(child: Image.asset("assets/product/pngfuel 6 (2).png",width: 150,)),
                                Gap(10),
                                CustomText(text: "Beverages", color:Colors.black),
                                Gap(5),
                              ]),
                        ),
                      ));

                  }

            )],
          ),
        ),
      ),
    );
  }
}



