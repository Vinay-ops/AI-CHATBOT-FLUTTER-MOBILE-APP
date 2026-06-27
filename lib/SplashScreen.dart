import 'dart:async';

import 'package:flutter/material.dart';

import 'HomeScreen.dart';

class SplashScreen extends StatefulWidget {

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() {
    return _SplashScreenState();
  }
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {

    super.initState();

    Timer(

      const Duration(seconds: 3),

      () {

        Navigator.pushReplacement(

          context,

          MaterialPageRoute(

            builder: (context) => const HomeScreen(),

          ),

        );

      },

    );

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: Colors.white,

      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,

          children: [

            Image.asset(

              "assets/logo.png",

              width: 150,

            ),

            const SizedBox(height: 20),

            const Text(

              "AI ChatBot",

              style: TextStyle(

                fontSize: 28,

                fontWeight: FontWeight.bold,

              ),

            ),

            const SizedBox(height: 30),

            const CircularProgressIndicator(),

          ],

        ),

      ),

    );

  }

}