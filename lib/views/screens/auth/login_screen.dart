import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Login',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              letterSpacing: 4,
            ),
          ),
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Email Address',
            ),
          ),
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Password',
            ),
          ),
          Container(
            height: 50,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              color: Colors.pink,
            ),
          ),
        ],
      ),
    );
  }
}
