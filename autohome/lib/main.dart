import 'package:autohome/app.dart';
import 'package:autohome/firebase_api.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  await FirebaseApi().initNotifications();

  await FirebaseMessaging.instance.subscribeToTopic("sample");

  runApp(const MyApp());
}
