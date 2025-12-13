import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomContinerNavigate extends StatelessWidget {
  const CustomContinerNavigate({super.key, this.onTab});
  final Function()? onTab ;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTab,
      child: Container(
        height: 60,width: 60,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Color(0xff53B175),
        ),
        child: Icon(Icons.arrow_forward_ios_outlined,color: Colors.white,),
      ),

    );
  }
}
