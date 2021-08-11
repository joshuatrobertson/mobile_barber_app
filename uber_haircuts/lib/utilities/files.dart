import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';


// Upload an image file to firebase and return the link
// ignore: missing_return
Future<String> uploadImage(File imageFile, String barber) async {
  String filename;
    FirebaseAuth.instance.signInAnonymously();
    FirebaseStorage firebaseStorage = FirebaseStorage.instance;
    Reference firebaseRef = firebaseStorage
        .ref()
    // DateTime.Now used to improve randomness
        .child(barber + '/${basename(imageFile.path)}' + DateTime.now().toString());
    UploadTask uploadTask = firebaseRef.putFile(imageFile);
    await uploadTask.whenComplete(() =>
        print(basename(imageFile.path) + ' uploaded')
    );
    await firebaseRef.getDownloadURL().then((fileURL) {
      filename = fileURL;
    });
  return filename;
}



// Get an image from the users gallery and return the file
Future<File> getImage() async {
  final _imagePicker = ImagePicker();

  final pickedImage = await _imagePicker.pickImage(source: ImageSource.gallery);
  return File(pickedImage.path);
}

