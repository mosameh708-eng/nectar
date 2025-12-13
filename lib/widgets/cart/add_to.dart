import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddTo extends StatelessWidget {
  const AddTo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,height: 40,
      decoration: BoxDecoration(
        color: Color(0xff53B175),
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Icon(Icons.add,color: Colors.white,),
    );
  }
}
