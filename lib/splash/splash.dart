import 'dart:async';

import 'package:flutter/material.dart';
import 'package:growpay/auth/auth.dart';
import 'package:growpay/auth/login.dart';
import 'package:growpay/home/home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => AuthService().handleAuth())));
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Text(
          "GroPay",
          style: TextStyle(
              color: Colors.green, fontSize: 46, fontFamily: "Oswald"),
        ),
      ),
    );
  }
}
