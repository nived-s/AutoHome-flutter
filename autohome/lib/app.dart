import 'package:autohome/screens/landingpage.dart';
import 'package:autohome/screens/loginpage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    FirebaseMessaging.instance.getToken().then((value) {
      print('token: $value');
    });

    return MaterialApp(
      title: 'AutoHome',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: LandingPage(),
      home: LoginPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
