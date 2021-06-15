import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uber_haircuts/helpers/navigate.dart';
import 'package:uber_haircuts/models/order.dart';
import 'package:uber_haircuts/screens/product_details.dart';
import 'package:uber_haircuts/widgets/return_text.dart';
import '../common_items.dart';

import '../common_items.dart';
import 'cart.dart';

class Cart extends StatefulWidget {


  createState() => _CartState();

  Cart();

}


class _CartState extends State<Cart> {
  int total = 0;
  List<OrderModel> _shoppingCart;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
          backgroundColor: lightGrey,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_outlined, color: theme,),
            onPressed: () {Navigator.pop(context);},
          ),
          title: Center(child: ReturnText(text: "Shopping Cart", size: 25, fontWeight: FontWeight.w400,)),
          ),

          body: SafeArea(
            child: Container(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
                child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                        child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: _shoppingCart.length,
                            itemBuilder: (_, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                                "assets/images/${_shoppingCart[index].product.image}.jpg",
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
                                                ReturnText(text: _shoppingCart[index].product.name,
                                                  size: 15,
                                                  fontWeight: FontWeight.bold,
                                                  align: TextAlign.left,),

                                                Row(
                                                    mainAxisAlignment: MainAxisAlignment
                                                        .spaceBetween,
                                                    children: [

                                                      ReturnText(
                                                          text: _shoppingCart[index].product.name,
                                                          color: Colors.black54,
                                                          size: 10),
                                                      ReturnText(text: "£" +
                                                          _shoppingCart[index].price.toString(),
                                                        size: 14,
                                                        color: Colors.redAccent,),
                                                    ]
                                                )
                                              ],
                                            ),
                                          ),

                                        ),
                                      ],
                                    ),
                                  ),
                                    IconButton(
                                      icon: Icon(Icons.delete_forever, color: theme,),
                                      onPressed: () {},
                                    ),
                                    ]),
                              );
                            }),
                      ),
                      Container(
                        padding: const EdgeInsets.fromLTRB(15, 0, 15, 20),
                        alignment: Alignment.bottomLeft,
                          child: ReturnText(text: 'Total = £' + total.toString(), size: 24,)),
                    ])
              ),
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
              items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
          icon: Icon(Icons.home_filled),
          label: 'Home',
            backgroundColor: Colors.grey,
        ),
      BottomNavigationBarItem(
        icon: Icon(Icons.account_box_rounded),
        label: 'My Account',
      ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_basket),
                  label: 'Shopping Cart',
                ),
        ])));
  }
}
