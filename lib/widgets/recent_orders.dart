import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RecentOrders extends StatelessWidget {
  const RecentOrders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
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
          color: Colors.blue,
        )
      ],
    );
  }
}
