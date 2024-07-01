import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class AuthController {
  final FirebaseStorage _storage = FirebaseStorage.instance;  // Stores firebase_storage package
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;  // Stores cloud_firestore package
  final FirebaseAuth _auth = FirebaseAuth.instance;  // Stores firebase_auth package
  
  // PICK IMAGE FROM GALLERY OR CAMERA
  pickProfileImage(ImageSource source) async {
    final ImagePicker _imagePicker = ImagePicker();  // Stores image_picker package

    XFile? _file = await _imagePicker.pickImage(source: source);  // Stores picked image

    // Checking if image was successfully selected or captured
    if (_file != null) {
      return await _file.readAsBytes();  // Converts selected image to bytes
    } else {
      print('No Image Selected or Captured!');
    }
  }

  // UPLOADS PROFILE IMAGE TO FIREBASE STORAGE  
  uploadImageToStorage(Uint8List? image) {
    _storage.ref().child('profileImages').child(_auth.currentUser!.uid);
  }
  
  // CREATES NEW USER
  Future<String> createNewUser(String email, String fullName, String password, Uint8List image) async {
    String res = 'Some error occurred';

    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email, 
        password: password
      );  // Stores user details

      await _firestore.collection('buyers').doc(userCredential.user!.uid).set({
        'fullName': fullName,
        'email': email,
        'buyerId': userCredential.user!.uid
      });

      res = 'Success';
    } catch (e) {
      res = e.toString();
    }

    return res;
  }
}