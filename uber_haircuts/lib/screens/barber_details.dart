import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uber_haircuts/helpers/navigate.dart';
import 'package:uber_haircuts/models/parent_barber.dart';
import 'package:uber_haircuts/screens/product_details.dart';
import 'package:uber_haircuts/screens/products.dart';
import 'package:uber_haircuts/widgets/return_text.dart';

import '../common_items.dart';

class BarberDetails extends StatefulWidget {
  final ParentBarber parentBarber;

  createState() => _BarberDetailsState();

  BarberDetails({@required this.parentBarber});

}
/*
Text(widget.barber.name),
Text(widget.barber.barberProducts[0].price.toString()),
Text(widget.barber.parentBarber)
*/

class _BarberDetailsState extends State<BarberDetails> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: lightGrey,
        body: SafeArea(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
              child: Container(
                  child: SizedBox(
                    child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: widget.parentBarber.barbers.length,
                        itemBuilder: (_, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: () {
                                navigateToScreen(
                                    _, Products(productList: widget.parentBarber.barbers[index].barberProducts));
                              },
                              child: Row(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: lightGrey,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(6.0)
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.1),
                                          spreadRadius: 8,
                                          blurRadius: 8,
                                          offset: Offset(0, 3),
                                        ),
                                      ],
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              8.0, 8.0, 8.0, 0),
                                          child: ClipRRect(
                                              borderRadius: BorderRadius.circular(6.0),
                                              child: Image.asset(
                                                "assets/images/${widget.parentBarber.barbers[index].image}.jpg",
                                                height: 100, width: 150,)
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(top: 4, left: 10),
                                          child:
                                          Container(
                                            width: 150,
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                ReturnText(text: widget.parentBarber.barbers[index].name,
                                                  size: 16,
                                                  fontWeight: FontWeight.bold,
                                                  align: TextAlign.left,),

                                                Row(
                                                    mainAxisAlignment: MainAxisAlignment
                                                        .spaceBetween,
                                                    children: [

                                                      ReturnText(
                                                          text: widget.parentBarber.name,
                                                          color: Colors.black54,
                                                          size: 10),
                                                      ReturnText(text: widget.parentBarber.barbers[index].rating.toString(), size: 24, color: black, fontWeight: FontWeight.w600,),
                                                      Padding(
                                                        padding: const EdgeInsets.only(bottom: 8.0),
                                                        child: Icon(Icons.star, color: theme, size: 14),
                                                      ),
                                                    ]
                                                )
                                              ],
                                            ),
                                          ),

                                        ),
                                      ],
                                    ),

                                  ),
                                  Expanded(
                                    child:
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: ReturnText(text: '"' + widget.parentBarber.barbers[index].description.toString() + '"', size: 10, color: black),
                                          ),
                                    ),
                                ],
                              ),
                            ),
                          );
                        }),
                  )
              ),
            ),
          ),
        ),
      ),
    );
  }
}



