import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_del/data/data.dart';
import 'package:food_del/models/restaurant.dart';
import 'package:food_del/screens/restauranr_screen.dart';
import 'package:food_del/widgets/rating_stars.dart';
import 'package:food_del/widgets/recent_orders.dart';

import 'cart_screen.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  _buildRestaurants() {
    List<Widget> restaurantList = [];
    for (var restaurant in restaurants) {
      restaurantList.add(
        GestureDetector(
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => RestaurantScreen(restaurant: restaurant),
              )),
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.grey.shade200, width: 1.0),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Hero(
                    tag: restaurant.imageUrl,
                    child: Image(
                      height: 150,
                      width: 150,
                      fit: BoxFit.cover,
                      image: AssetImage(restaurant.imageUrl),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          restaurant.name,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        RatingStars(rating: restaurant.rating),
                        const SizedBox(height: 4),
                        Text(
                          restaurant.address,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 4),
                        const Text(
                          '3Km away',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );
    }
    return Column(children: restaurantList);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.account_circle,
            size: 30,
          ),
          onPressed: () {},
        ),
        title: Text('Food Delivery'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => CartScreen()));
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
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Nearby Restaurant',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 24,
                      letterSpacing: 1.2),
                )
              ],
            ),
          ),
          _buildRestaurants(),
        ],
      ),
    );
  }
}
