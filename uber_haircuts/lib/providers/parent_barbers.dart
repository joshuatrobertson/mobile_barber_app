import 'package:flutter/cupertino.dart';
import 'package:uber_haircuts/models/barber.dart';
import 'package:uber_haircuts/models/parent_barber.dart';
import 'package:uber_haircuts/models/product.dart';
import 'package:uber_haircuts/utilities/parent_barbers_firestore.dart';

class ParentBarbersProvider extends ChangeNotifier {

  // Create an instance of firestore
  ParentBarbersFirestore _parentFirestore = ParentBarbersFirestore();
  List<ParentBarberModel> _parents = [];

  List<BarberModel> _barbers = [];
  List<ProductModel> _products = [];

  get parents => _parents;
  get barbers => _barbers;
  get products => _products;

  ParentBarbersProvider() {
    _loadParents();
    _loadBarbers();
    _loadProducts();
  }

  // Returns a list of ProductModel using getProducts() of parent_barbers_firestore.dart
  _loadProducts() async {
    try {
      _products = await _parentFirestore.getProducts();
      notifyListeners();
      print("Products loaded!");
    } catch (e) {
      print("Loading of products failed with error: " + e.toString());
    }
  }

  // Returns a list of ParentBarberModel
  _loadParents() async {
    try {
      // Load all the items into memory to reduce server calls and decrease load/ lookup times
      _parents = await _parentFirestore.getLocalItems(51.466627397117726, -2.61624, 100000000);
      print("Parent barbers loaded!");
      print("PARENT 1 = " + _parents[0].name);
    } catch (e) {
      print("Loading of parent barbers failed with error: " + e.toString());    }
  }

  // Returns a list of BarberModel
  _loadBarbers() async {
    try {
      _barbers = await _parentFirestore.getBarbers();
      notifyListeners();
      print('Barbers loaded!');
    } catch (e) {
      print("Loading of barbers failed with error: " + e.toString());
    }
  }

}