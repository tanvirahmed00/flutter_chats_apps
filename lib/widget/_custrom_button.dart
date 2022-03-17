
import 'package:flutter/material.dart';
Widget custrom_button(function,icon, size,color){
  return IconButton(onPressed: function, icon:Icon(icon,),iconSize: size,color: color,);
}