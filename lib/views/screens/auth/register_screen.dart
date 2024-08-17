import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';

import 'package:uber_shop_app/controllers/auth_controller.dart';
import 'package:uber_shop_app/views/screens/auth/login_screen.dart';

class RegisterScreen extends StatefulWidget {
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  // const RegisterScreen({super.key});
  final AuthController _authController = AuthController();  // Stores AuthController class
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();  // Form Key

  late String email;

  late String fullName;

  late String password;

  Uint8List? _image;  // Stores picked image


  // Selects image from phone gallery
  selectGalleryImage() async {
    Uint8List im = await _authController.pickProfileImage(ImageSource.gallery);
  }

  // Captures image using phone camera
  captureImage() async {
    await _authController.pickProfileImage(ImageSource.camera);
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
                'Register',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 4,
                ),
              ),

              const SizedBox(height: 15,),

              Stack(
                children: [
                  const CircleAvatar(
                    radius: 65,
                    child: Icon(
                      Icons.person,
                      size: 60,
                    ),
                  ),
                  Positioned(
                    // right: 0,
                    // right: 3,
                    right: -14,
                    top: 15,
                    // child: Icon(Icons.camera_alt),
                    child: IconButton(
                      onPressed: () {
                        selectGalleryImage();
                      },
                      icon: const Icon(Icons.camera_alt),
                    ),
                  ),
                ],
              ),

              // CircleAvatar(
              //   radius: 65,
              //   child: Icon(Icons.person, size: 60,),
              // ),

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
                  prefixIcon: Icon(
                    Icons.email,
                    color: Colors.pink,
                  ),
                ),
              ),

              const SizedBox(height: 20,),

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
                  hintText: 'Enter Full Name...',
                  prefixIcon: Icon(
                    Icons.person,
                    color: Colors.pink,
                  ),
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
                  prefixIcon: Icon(
                    Icons.lock,
                    color: Colors.pink,
                  ),
                ),
              ),

              const SizedBox(height: 20,),

              InkWell(
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    _authController.createNewUser(email, fullName, password);
                    print('Valid');
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
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 4,
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20,),

              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return LoginScreen();
                    }),
                  );
                },
                child: const Text('Already have an account?'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
