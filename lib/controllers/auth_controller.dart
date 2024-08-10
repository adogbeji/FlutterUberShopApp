import 'package:firebase_auth/firebase_auth.dart';

class AuthController {
  final FirebaseAuth _auth = FirebaseAuth.instance;  // Stores firebase_auth package

  // Creates New User
  Future<String> createNewUser(String email, String fullName, String password) async {
    String res = 'An error occurred';

    try {
      await _auth.createUserWithEmailAndPassword(email: email, password: password);

      res = 'Success';
    } catch (e) {
      res = e.toString();
    }

    return res;
  }
}