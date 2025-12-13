import 'package:flutter/material.dart';
import 'package:nectar/auth/sign_up.dart';
import 'package:nectar/root/root.dart';
import 'package:nectar/auth/log_in.dart';
import 'package:nectar/root/shop.dart';
import 'package:nectar/screens/on_bording.dart';
import 'package:nectar/screens/order_accepted.dart';
import 'package:nectar/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:SignUp(),
    );
  }}