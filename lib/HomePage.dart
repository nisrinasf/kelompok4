import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/CategoriesWidget.dart';
import 'package:flutter_application_1/widgets/HomeAppBar.dart';

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: ListView(children:[
        HomeAppBar(),
        Container(
          height: 500,
          padding: EdgeInsets.only(top: 15),
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 245, 245, 245),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(35),
              topRight: Radius.circular(35),
            ),
          ),
          child: Column(children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
              padding: EdgeInsets.symmetric(horizontal: 15),
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(children: [
                Container(
                  margin: EdgeInsets.only(left: 5),
                  height: 50,
                  width: 300,
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Search here...",
                    ),
                  ),
                ),
                Spacer(),
                Icon(
                  Icons.camera_alt,
                  size: 27,
                  color: Colors.green,
                ),
              ],),
            ),
            Container(
              alignment:  Alignment.centerLeft,
              margin: EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 10,
              ),
              child: Text("Categories",
              style: TextStyle(fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.green,
              ),
              ),
            ),
            
            // Categories
            CategoriesWidget(),
          ],),
        ),
      ],),
    );
  }
}