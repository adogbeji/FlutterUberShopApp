import 'package:flutter/material.dart';
import 'package:uber_shop_app/views/screens/auth/login_screen.dart';

class RegisterScreen extends StatelessWidget {
  // const RegisterScreen({super.key});
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();  // Form Key

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
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
        
            const SizedBox(height: 20,),
        
            // EMAIL INPUT FIELD
            TextFormField(
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
            
            // NAME INPUT FIELD
            TextFormField(
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
                prefixIcon: Icon(Icons.person, color: Colors.pink,),
              ),
            ),
        
            const SizedBox(height: 20,),
        
            // PASSWORD INPUT FIELD
            TextFormField(
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
        
            InkWell(
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width - 40,
                decoration: BoxDecoration(
                  color: Colors.pink,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Center(
                  child: Text('Register', style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 4,
                  ),),
                ),
              ),
            ),
        
            const SizedBox(height: 20,),
        
            TextButton(onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const LoginScreen();
              }),);
            }, child: const Text('Already have an account?'),),
          ],
        ),
      ),
    );
  }
}
