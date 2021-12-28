import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_del/data/data.dart';
import 'package:food_del/models/order.dart';

class RecentOrders extends StatelessWidget {
  _buildRecentOrder(BuildContext context, Order order) {
    return Row(
      children: [
        Container(
          margin: EdgeInsets.all(10.0),
          width: 320,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(17),
            border: Border.all(
              width: 1.0,
              color: Colors.grey,
            ),
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Image(
                  height: 100,
                  width: 100,
                  fit: BoxFit.cover,
                  image: AssetImage(order.food.imageUrl),
                ),
              ),
              Container(
                margin: EdgeInsets.all(12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      order.food.name,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 4),
                    Text(
                      order.restaurant.name,
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 4),
                    Text(
                      order.date,
                      style:
                          TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 20.0),
                width: 48,
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(30.0)),
                child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 30.0,
                    )),
              )
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(
            'Recent Orders',
            style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.w400,
                letterSpacing: 1.2),
          ),
        ),
        Container(
          height: 120.0,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: currentUser.orders.length,
            itemBuilder: (BuildContext context, int index) {
              Order order = currentUser.orders[index];
              return _buildRecentOrder(context, order);
            },
          ),
        )
      ],
    );
  }
}
