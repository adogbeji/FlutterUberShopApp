import 'package:flutter/material.dart';

import './register_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
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
            const SizedBox(
              height: 25,
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Email Address',
                hintText: 'Enter Email Address',
                prefixIcon: Icon(Icons.email, color: Colors.pink,),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Password',
                hintText: 'Enter Password',
                prefixIcon: Icon(Icons.lock, color: Colors.pink,),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            InkWell(
              onTap: () {
                print('Logged In!');
              },
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width - 40,
                decoration: BoxDecoration(
                  color: Colors.pink,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(
                  child: Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      letterSpacing: 4,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            // InkWell(
            //   onTap: () {},
            //   child: const Text(
            //     'Need An Account?',
            //   ),
            // ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return RegisterScreen();
                  }),
                );
              },
              child: const Text('Need An Account?'),
            ),
          ],
        ),
      ),
    );
  }
}