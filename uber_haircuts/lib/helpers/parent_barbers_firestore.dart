import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:uber_haircuts/models/parent_barber.dart';
import '../models/product.dart';

class ParentBarbersFirestore {

  // Connect to the database and create a collection reference
  final CollectionReference _collectionReference = FirebaseFirestore.instance.collection('parentBarbers');


  Future<List<ParentBarberModel>> getParentBarbers() async =>
      // Go through the collection 'products'
  _collectionReference.get().then((value) {
    List<ParentBarberModel> parents = [];
    // for each item within products add to a list and return
    for (DocumentSnapshot parent in value.docs) {
      parents.add(ParentBarberModel.fromSnapshot(parent));
    }
    return parents;
  });

  ParentBarbersFirestore();

}