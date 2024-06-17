import 'package:flutter/material.dart';

import 'package:uber_shop_app/controllers/auth_controller.dart';
import 'package:uber_shop_app/views/screens/auth/login_screen.dart';

class RegisterScreen extends StatelessWidget {
  // const RegisterScreen({super.key});
  final AuthController _authController = AuthController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();  // Form Key

  // Variables to store user input
  late String email;
  late String fullName;
  late String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Register',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 4,
                ),
              ),
        
              const CircleAvatar(
                radius: 65,
                child: Icon(Icons.person, size: 55,),
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
                },
                decoration: const InputDecoration(
                  labelText: 'Email Address',
                  hintText: 'Enter Email Address',
                  prefixIcon: Icon(
                    Icons.email,
                    color: Colors.pink,
                  ),
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
                    return 'Name Must Not Be Empty!';
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
                    _authController.createNewUser(email, fullName, password);
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return LoginScreen();
                      },
                    ),
                  );
                },
                child: const Text('Already Have An Account?'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
