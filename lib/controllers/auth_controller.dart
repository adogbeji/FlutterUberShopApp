import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';

class AuthController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Select image from gallery or camera
  pickProfileImage(ImageSource source) async {
    final ImagePicker _imagePicker = ImagePicker();  // Stores image_picker package

    XFile? _file = await _imagePicker.pickImage(source: source);  // Stores selected image

    if (_file != null) {
      return await _file.readAsBytes();  // Converts selected image to readable format
    } else {
      print('No image selected!');
    }
  }

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