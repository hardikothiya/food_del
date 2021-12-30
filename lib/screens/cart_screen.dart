import 'package:flutter/material.dart';
import 'package:food_del/data/data.dart';
import 'package:food_del/models/order.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  _cartBuilder(Order order) {
    return (Container(
      padding: EdgeInsets.all(20.0),
      height: 170,
      child: Row(
        children: [],
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart '),
      ),
      body: ListView.separated(
          itemBuilder: (BuildContext context, int index) {
            Order order = currentUser.cart[index];
            return _cartBuilder(order);
          },
          separatorBuilder: (BuildContext context, int index) {
            return Divider(
              height: 1,
              color: Colors.blue,
            );
          },
          itemCount: currentUser.cart.length),
    );
  }
}
