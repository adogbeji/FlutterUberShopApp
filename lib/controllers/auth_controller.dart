import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';

class AuthController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;  // Stores cloud_firestore package
  final FirebaseAuth _auth = FirebaseAuth.instance;  // Stores firebase_auth package

  // Selects image from phone gallery or captures image with phone camera
  pickProfileImage(ImageSource source) async {
    final ImagePicker _imagePicker = ImagePicker();  // Stores image_picker package

    XFile? _file = await _imagePicker.pickImage(source: source);

    if (_file != null) {
      return await _file.readAsBytes();  // Converts picked image into readable format
    }
  }

  // Creates New User
  Future<String> createNewUser(String email, String fullName, String password) async {
    String res = 'An error occurred';

    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email, 
        password: password
      );  // Creates new user

      await _firestore.collection('buyers').doc(userCredential.user!.uid).set({
        'fullName': fullName,
        'email': email,
        'buyerId': userCredential.user!.uid,
      });  // Stores user details in Firestore database

      res = 'Success';
    } catch (e) {
      res = e.toString();
    }

    return res;
  }
}