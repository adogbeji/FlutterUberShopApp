import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:uber_shop_app/controllers/auth_controller.dart';
import 'package:uber_shop_app/views/screens/auth/register_screen.dart';
import 'package:uber_shop_app/views/screens/map_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // const LoginScreen({super.key});
  final AuthController _authController = AuthController();  // Stores AuthController class
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();  // Form Key
  
  bool _isLoading = false;  // Stops loading spinner
  
  late String email;

  late String password;

  // Calls method in AuthController class to log in user
  loginUser() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;  // Starts loading spinner
      });

      String res = await _authController.loginUser(email, password);

      setState(() {
        _isLoading = false;  // Stops loading spinner
      });

      if (res == 'Success') {
        setState(() {
          _isLoading = false;  // Stops loading spinner
        });

        Get.to(const MapScreen());
        Get.snackbar(
          'Login Success', 
          'You are now logged in!', 
          backgroundColor: Colors.pink, 
          colorText: Colors.white,
        );
      } else {
        Get.snackbar(
          'Error Occured',
          res.toString(),
          backgroundColor: Colors.red,
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM
        );
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
                  child: _isLoading ? const CircularProgressIndicator(
                    color: Colors.white,
                  ): const Center(
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
