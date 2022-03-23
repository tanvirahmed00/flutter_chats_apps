import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
Widget CustomCard (String image,String name,String txt){
  return ListTile(
    title: Text(name),
    subtitle:Text(txt),
    leading:CircleAvatar(
    radius: 30,
      backgroundImage:
      NetworkImage(image),
      backgroundColor: Colors.transparent,
  ),
    trailing: Icon(Icons.access_time_sharp),
    
  );

}