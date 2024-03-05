import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String> createNewUser(String email, String fullName, String password) async {
    String res = 'Some error occurred!';

    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(email: email, password: password);

      await _firestore.collection('buyers').doc(userCredential.user!.uid).set({
        'fullName': fullName,
        'email': email,
        'buyerId': userCredential.user!.uid,
      });

      res = 'Success';
    } catch (e) {
      res = e.toString();
    }
    
    return res;
  }
}