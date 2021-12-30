import 'package:flutter/material.dart';
import 'package:food_del/models/food.dart';
import 'package:food_del/models/restaurant.dart';
import 'package:food_del/widgets/rating_stars.dart';
import 'home_screen.dart';

class RestaurantScreen extends StatefulWidget {
  RestaurantScreen({required this.restaurant});
  final Restaurant restaurant;
  @override
  _RestaurantScreenState createState() => _RestaurantScreenState();
}

_buildMenuItem(Food menuItem) {
  return Center(
    child: Stack(
      alignment: Alignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 175,
            width: 175,
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(menuItem.imageUrl),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(15.0)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 175,
            width: 175,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Colors.black.withOpacity(0.3),
                  Colors.black87.withOpacity(0.3),
                  Colors.black54.withOpacity(0.3),
                  Colors.black38.withOpacity(0.3),
                ],
                stops: [0.1, 0.4, 0.6, 0.9],
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 60.0,
          child: Column(
            children: [
              Text(
                menuItem.name,
                style: TextStyle(
                    fontSize: 24,
                    letterSpacing: 1.2,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                '\$${menuItem.price}',
                style: TextStyle(
                    fontSize: 18,
                    letterSpacing: 1.2,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
        Positioned(
          bottom: 8,
          right: 8,
          child: Container(
            width: 48.0,
            decoration: BoxDecoration(
              color: Colors.teal,
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: IconButton(
              icon: Icon(Icons.add),
              iconSize: 30.0,
              color: Colors.white,
              onPressed: () {},
            ),
          ),
        )
      ],
    ),
  );
}

class _RestaurantScreenState extends State<RestaurantScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Hero(
                tag: widget.restaurant.imageUrl,
                child: Image(
                  fit: BoxFit.cover,
                  height: 220,
                  width: MediaQuery.of(context).size.width,
                  image: AssetImage(
                    widget.restaurant.imageUrl,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(
                        Icons.arrow_back_ios_outlined,
                        color: Colors.white,
                      ),
                    ),
                    IconButton(
                      onPressed: null,
                      icon: Icon(
                        Icons.favorite,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.restaurant.name,
                      style: TextStyle(
                          fontSize: 22.0, fontWeight: FontWeight.w600),
                    ),
                    const Text(
                      ' 2km away ',
                      style: TextStyle(fontSize: 18.0),
                    ),
                  ],
                ),
                RatingStars(rating: widget.restaurant.rating),
                SizedBox(
                  height: 6.0,
                ),
                Text(
                  widget.restaurant.address,
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        )),
                        backgroundColor: MaterialStateProperty.all(
                            Theme.of(context).primaryColor),
                        padding: MaterialStateProperty.all(
                          EdgeInsets.symmetric(horizontal: 25, vertical: 0),
                        ),
                      ),
                      onPressed: null,
                      child: Text(
                        'Reviews',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                    TextButton(
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        )),
                        backgroundColor: MaterialStateProperty.all(
                            Theme.of(context).primaryColor),
                        padding: MaterialStateProperty.all(
                          EdgeInsets.symmetric(horizontal: 25, vertical: 0),
                        ),
                      ),
                      onPressed: null,
                      child: Text(
                        'Contact',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 10),
                Center(
                  child: Text(
                    'Menu',
                    style: TextStyle(
                        fontSize: 22,
                        letterSpacing: 1.2,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 0.1),
          Expanded(
            child: GridView.count(
              padding: EdgeInsets.all(20.0),
              crossAxisCount: 2,
              children: List.generate(widget.restaurant.menu.length, (index) {
                Food food = widget.restaurant.menu[index];
                return _buildMenuItem(food);
              }),
            ),
          ),
        ],
      ),
    );
  }
}
