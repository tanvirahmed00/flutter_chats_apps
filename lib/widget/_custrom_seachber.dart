import 'package:flutter/material.dart';
Widget custrom_search_ber(){
  return Container(
    margin: EdgeInsets.only(
      left: 10,
      right: 10,
      top: 5,
      bottom: 10,
    ),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(50),
      color: Colors.grey,
    ),
    child: TextField(
      decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: Icon(Icons.search),
          focusColor: Colors.white,
          hoverColor: Colors.red,
          fillColor: Colors.white),
    ),
  );
}