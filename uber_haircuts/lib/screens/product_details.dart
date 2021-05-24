import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uber_haircuts/models/barber.dart';
import 'package:uber_haircuts/models/prices.dart';

class ProductDetails extends StatefulWidget {
  final Barber barber;

  createState() => _ProductDetailsState();

  ProductDetails({@required this.barber});

}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          Text(widget.barber.name),
          Text(widget.barber.barberProducts[0].price.toString()),
          Text(widget.barber.parentBarber)
        ],
      )
    );
  }
}

