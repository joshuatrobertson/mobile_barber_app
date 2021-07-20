import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uber_haircuts/models/location.dart';
import 'package:uber_haircuts/models/user.dart';


class UserFirestore {
  static const USERS = "users";
  FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  // Method to add a new user through using collection.set
  void createNewUser(Map<String, dynamic> values, String userId)  {
    _firebaseFirestore.collection(USERS).doc(userId).set(values);
  }

  // Method to update an existing user
  void editUser(Map<String, dynamic> values)  {
    String id = values["uid"];
    _firebaseFirestore.collection(USERS).doc(values[id]).update(values);
  }

  // Fetch the user based on a given ID
  Future<UserModel> getUserById(String userId) {
    _firebaseFirestore.collection(USERS).doc(userId).get().then((value) {
      return UserModel.fromSnapshot(value);
    });
  }

  // Fetch the user based on a given ID
  UserModel getSingleUserById(String userId) {
    _firebaseFirestore.collection(USERS).doc(userId).get().then((value) {
      return UserModel.fromSnapshot(value);
    });
  }

  // Method to add location details to the user
  void addLocationDetails(Map<String, dynamic> values, String userId)  {
    _firebaseFirestore.collection(USERS).doc(userId).update(values);
  }

  void addCurrentLocation(Map<String, dynamic> value, String userId) {
    _firebaseFirestore.collection(USERS).doc(userId).update(value);
  }

  bool checkUserExists(String userId) {
    bool val = false;
    _firebaseFirestore.collection(USERS).doc(userId).get().then((value) => {
      if (value.exists) {
        val = true
      }
      });
    return val;
    }
}