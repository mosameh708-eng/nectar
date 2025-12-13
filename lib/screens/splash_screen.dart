import 'package:flutter/material.dart';
import 'package:nectar/screens/on_bording.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.push(context, MaterialPageRoute(builder: (c) => OnBording()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 600,
        decoration: BoxDecoration(
          color: Color(0xff53B175),
          image: DecorationImage(image: AssetImage("assets/logo/Group 1.png")),
        ),
      ),
    );
  }
}
