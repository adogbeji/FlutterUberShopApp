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
            'Log In',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              letterSpacing: 4,
            ),
          ),

          // EMAIL INPUT FIELD
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Email',
            ),
          ),

          // PASSWORD INPUT FIELD
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Password',
            ),
          ),

          // LOGIN BUTTON
          Container(
            height: 50,
            width: MediaQuery.of(context).size.width - 40,
            decoration: const BoxDecoration(
              color: Colors.pink,
            ),
            child: const Center(
              child: Text('Log In'),
            ),
          ),
        ],
      ),
    );
  }
}
