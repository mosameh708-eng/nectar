import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText( {
    super.key,
    required this.text,
    this.fontsize = 16,
    required this.color ,
    this.weight = FontWeight.w600,
  });
  final String text;
  final double fontsize;
  final Color color;
  final FontWeight weight;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontsize,
        color: color,
        fontWeight: weight,
      ),
    );
  }
}
