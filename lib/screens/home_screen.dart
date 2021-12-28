import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_del/data/data.dart';
import 'package:food_del/widgets/recent_orders.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.account_circle,
            size: 30,
          ),
          onPressed: () {},
        ),
        title: Text('Food Delivery'),
        actions: [
          TextButton(
            onPressed: () {
              print('cart pressed');
            },
            child: Text('cart(${currentUser.cart.length})',
                style: TextStyle(color: Colors.white, fontSize: 20)),
          )
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(20.0),
            child: TextField(
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                hintText: 'Search food or restaurant',
                contentPadding: EdgeInsets.symmetric(vertical: 15.0),
                border: OutlineInputBorder(
                    borderSide: BorderSide(width: 0.8),
                    borderRadius: BorderRadius.circular(30.0)),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        width: 0.8, color: Theme.of(context).primaryColor),
                    borderRadius: BorderRadius.circular(30.0)),
                prefixIcon: const Icon(
                  Icons.search,
                  size: 30,
                ),
                suffixIcon: IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () {},
                ),
              ),
            ),
          ),
          RecentOrders(),
        ],
      ),
    );
  }
}
