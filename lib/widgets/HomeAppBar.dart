import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Container(
      color: Colors.green,
      padding: EdgeInsets.symmetric(vertical: 25, horizontal: 25),
      child: Row(
        children: [
        Icon(
          Icons.sort, 
          size:30,
          color: Colors.black ,
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 20,
              ),
              child: Text(
              "KANTIN NEMU",
              style:TextStyle(
                fontSize: 20, 
                fontWeight: FontWeight.bold,
                color: Colors.black,
                ),
              ),
            ),
            Spacer(),
            Badge(
              badgeColor: Colors.red,
              padding: EdgeInsets.all(7),
              badgeContent: Text(
                "99+",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              child : InkWell(
                onTap: () {},
                child: Icon(Icons.shopping_bag_outlined,
                size: 30,
                color: Colors.black,
                ),
              ),
            ),
      ]),
    );
  }
}