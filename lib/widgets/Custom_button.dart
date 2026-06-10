import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nectar/widgets/custom_text.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.title,
    required this.onTap,
    required this.color,
    required this.svgs,
    required this.svg,
    required this.fontcolor,
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
        padding: const EdgeInsets.all(15),
        child: Container(
          height: 55,
          width: 300,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(20.0),
            shape: BoxShape.rectangle,
          ),
          child: Row(
            children: [
              if (issvg) ...[
                Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: SvgPicture.asset(svg),
                ),
              ],
              Expanded(
                child: Center(
                  child: CustomText(
                    text: title,
                    color: fontcolor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
