import 'package:flutter/material.dart';

class CustomNavigate extends StatelessWidget {
  const CustomNavigate({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: (){
          Navigator.pop(context);
        },
            child: Align(
              alignment: Alignment.topLeft,
                child: Icon(Icons.arrow_back_ios))
      );


  }
}
