import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:uber_shop_app/secrets/secret_keys.dart';

import 'package:uber_shop_app/views/screens/auth/login_screen.dart';
import 'package:uber_shop_app/views/screens/auth/register_screen.dart';

// SECRET KEYS
final secrets = SecretKeys();

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Ensures all Flutter widgets have been successfully initialised

  Platform.isAndroid
      ? await Firebase.initializeApp(
          options: FirebaseOptions(
              apiKey: secrets.apiKey,
              appId: secrets.appId,
              messagingSenderId: secrets.messagingSenderId,
              projectId: secrets.projectId,
              storageBucket: secrets.storageBucket),
          )
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
      // home: const LoginScreen(),
      home: RegisterScreen(),
    );
  }
}
