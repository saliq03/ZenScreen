import 'dart:io';
import 'package:flutter/material.dart';
import 'package:zenscreen/Pages/bottom_nav.dart';
import 'package:firebase_core/firebase_core.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Platform.isAndroid?
  Firebase.initializeApp(options: FirebaseOptions(
      apiKey: "AIzaSyBIQyP6KseF5uZnfZEMgdZdodqG4zVcVhg",
      appId: "1:435843087214:android:cc979fa854b5092dcadf7f",
      messagingSenderId: "435843087214",
      projectId: "zenscreen-e56f6")):
  Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ZenScreen',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.highContrastLight(),
        useMaterial3: true,
      ),
      home: BottomNav(),

    );
  }
}

