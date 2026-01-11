import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nectar/auth/account.dart';
import 'package:nectar/auth/cubit/signup_cubit.dart';
import 'package:nectar/auth/cubit1/login_cubit.dart';
import 'package:nectar/auth/sign_up.dart';
import 'package:nectar/root.dart';
import 'package:nectar/auth/log_in.dart';
import 'package:nectar/screens/favourite.dart';
import 'package:nectar/screens/product_details.dart';
import 'package:nectar/screens/shop.dart';
import 'package:nectar/screens/on_bording.dart';
import 'package:nectar/screens/order_accepted.dart';
import 'package:nectar/screens/selection_location.dart';
import 'package:nectar/screens/splash_screen.dart';
import 'package:nectar/widgets/cart/cart.dart';

void main() {
  runApp(const MyApp());
  BlocProvider(
    create: (context) => SignupCubit(),
    child: SignUp(),
  );
  BlocProvider(
    create: (context) => LoginCubit(),
    child: LogIn(),
  );

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
      ),
      home: SplashScreen(),
    );
  }
}