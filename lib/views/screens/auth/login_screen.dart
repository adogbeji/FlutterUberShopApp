import 'package:flutter/material.dart';

import 'package:uber_shop_app/controllers/auth_controller.dart';
import 'package:uber_shop_app/views/screens/auth/register_screen.dart';

class LoginScreen extends StatelessWidget {
  // const LoginScreen({super.key});
  final AuthController _authController = AuthController();  // Stores AuthController class
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();  // Form Key

  late String email;

  late String password;

  // Calls method in AuthController class to log in user
  loginUser() async {
    if (_formKey.currentState!.validate()) {
      String res = await _authController.loginUser(email, password);

      if (res == 'Success') {
        print('Logged In!');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Form(
          key: _formKey,
          child: Column(
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
          
              const SizedBox(height: 20,),
          
              // EMAIL INPUT FIELD
              TextFormField(
                onChanged: (value) {
                  email = value;
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Email Must Not Be Empty!';
                  } else {
                    return null;
                  }
                },
                decoration: const InputDecoration(
                  labelText: 'Email',
                  hintText: 'Enter Email...',
                  prefixIcon: Icon(Icons.email, color: Colors.pink,),
                ),
              ),
          
              const SizedBox(height: 20,),
          
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
                  hintText: 'Enter Password...',
                  prefixIcon: Icon(Icons.lock, color: Colors.pink,),
                ),
              ),
          
              const SizedBox(height: 20,),
          
              // LOGIN BUTTON
              InkWell(
                onTap: () {
                  loginUser();
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
                      'Log In',
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 4,
                      ),
                    ),
                  ),
                ),
              ),
          
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
      ),
    );
  }
}
