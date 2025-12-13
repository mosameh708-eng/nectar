import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:nectar/widgets/custom_text.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.title,
    required this.onTap,
    required this.color,
    required this.svgs,
    required this.svg, required this.fontcolor,
  });
  final String title;
  final Color color;
  final Color fontcolor;
  final Function()? onTap;
  final bool svgs;
  final String svg;
  @override
  Widget build(BuildContext context) {
    bool issvg = svgs;
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          height: 55,
          width: double.infinity,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(20.0),
            shape: BoxShape.rectangle,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              issvg ? SvgPicture.asset(svg) : SizedBox.shrink(),
              Gap(25),
              Align(
                alignment: Alignment.center,
                child: CustomText(text: title, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
