import 'package:flutter/foundation.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class AuthController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;  // Stores cloud_firestore package
  final FirebaseAuth _auth = FirebaseAuth.instance;  // Stores firebase_auth package
  final FirebaseStorage _storage = FirebaseStorage.instance;  // Stores firebase_storage package

  // Selects image from phone gallery or captures image with phone camera
  pickProfileImage(ImageSource source) async {
    final ImagePicker _imagePicker = ImagePicker();  // Stores image_picker package

    XFile? _file = await _imagePicker.pickImage(source: source);

    if (_file != null) {
      return await _file.readAsBytes();  // Converts picked image into readable format
    } else {
      print('No image selected or captured!');
    }
  }

  // Uploads profile image to Firebase Storage
  _uploadImageToStorage(Uint8List? image) async {
    Reference ref = _storage.ref()
                            .child('profileImages')
                            .child(_auth.currentUser!.uid);

    UploadTask uploadTask = ref.putData(image!);  // Stores result of uploaded image

    TaskSnapshot snapshot = await uploadTask;
    String downloadURL = await snapshot.ref.getDownloadURL();  // Stores image download URL

    return downloadURL;
  }

  // Creates New User
  Future<String> createNewUser(String email, String fullName, String password, Uint8List? image) async {
    String res = 'An error occurred';

    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email, 
        password: password
      );  // Creates new user

      String downloadURL = await _uploadImageToStorage(image);  // Stores image download URL

      await _firestore.collection('buyers').doc(userCredential.user!.uid).set({
        'fullName': fullName,
        'profileImage': downloadURL,
        'email': email,
        'buyerId': userCredential.user!.uid,
      });  // Stores user details in Firestore database

      res = 'Success';
    } catch (e) {
      res = e.toString();
    }

    return res;
  }

  // Log In Created User
  Future<String> loginUser(String email, String password) async {
    String res = 'An error occurred';

    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);  // Logs in registered user

      res = 'Success';
    } catch (e) {
      res = e.toString();
    }

    return res;
  }
}