import 'package:flutter/material.dart';

import './login_screen.dart';

class RegisterScreen extends StatelessWidget {
  // const RegisterScreen({super.key});
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late String email;
  late String fullName;
  late String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Register Account',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                letterSpacing: 4,
              ),
            ),
        
            const SizedBox(
              height: 20,
            ),
            
            // EMAIL INPUT FIELD
            TextFormField(
              onChanged: (value) {
                email = value;
              },
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Email Address Must Not Be Empty!';
                } else {
                  return null;
                }
              } ,
              decoration: const InputDecoration(
                labelText: 'Email Address',
                hintText: 'Enter Email Address',
                prefixIcon: Icon(
                  Icons.email,
                  color: Colors.pink,
                ),
                // border: OutlineInputBorder(),
              ),
            ),
        
            const SizedBox(
              height: 20,
            ),
            
            // NAME INPUT FIELD
            TextFormField(
              onChanged: (value) {
                fullName = value;
              },
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Full Name Must Not Be Empty!';
                } else {
                  return null;
                }
              },
              decoration: const InputDecoration(
                labelText: 'Full Name',
                hintText: 'Enter Full Name',
                prefixIcon: Icon(
                  Icons.person,
                  color: Colors.pink,
                ),
              ),
            ),
        
            const SizedBox(
              height: 20,
            ),
            
            // PASSWORD INPUT FIELD
            TextFormField(
              onChanged: (value) {
                password = value;
              },
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Password Must Not Be Empty!';
                } else {
                  return null;
                }
              },
              decoration: const InputDecoration(
                labelText: 'Password',
                hintText: 'Enter Password',
                prefixIcon: Icon(
                  Icons.lock,
                  color: Colors.pink,
                ),
              ),
            ),
        
            const SizedBox(
              height: 20,
            ),
        
            // REGISTER BUTTON
            InkWell(
              onTap: () {
                if (_formKey.currentState!.validate()) {
                  print(email);
                  print(fullName);
                  print(password);
                } else {
                  print('Not Valid!');
                }
              },
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width - 40,
                decoration: BoxDecoration(
                  color: Colors.pink,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Center(
                  child: Text(
                    'Register',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: 4,
                    ),
                  ),
                ),
              ),
            ),
        
            const SizedBox(
              height: 20,
            ),
        
            TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return LoginScreen();
                }),);
              },
              child: const Text(
                'Already have an account?',
              ),
            ),
          ],
        ),
      ),
    );
  }
}