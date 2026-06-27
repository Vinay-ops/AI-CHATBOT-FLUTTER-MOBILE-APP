import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'splash_screen.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: ".env");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(

      debugShowCheckedModeBanner: false,

      title: "AI ChatBot",

      theme: ThemeData(
        colorSchemeSeed: Colors.blue,
        useMaterial3: true,
      ),

      home: const SplashScreen(),

    );
  }
}