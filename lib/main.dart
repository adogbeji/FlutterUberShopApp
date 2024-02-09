import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import './views/screens/auth/login_screen.dart';
// import './views/screens/auth/register_screen.dart';

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // Ensures all widgets have been initialised

  Platform.isAndroid
      ? await Firebase.initializeApp(
          options: const FirebaseOptions(
              apiKey: 'AIzaSyCyrhSECtPtFLwQ2FpO7NH6sqamscfIWRg',
              appId: '1:598483068590:android:2aab2445e54e9331a92f3f',
              messagingSenderId: '598483068590',
              projectId: 'uber-shop-app-2767c',
              storageBucket: 'gs://uber-shop-app-2767c.appspot.com'))
      : await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LoginScreen(),
    );
  }
}
