
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
PreferredSizeWidget custrom_appBerr(context,image_fun,function1,function2,String txt,String image,icons1,icons2){

  return AppBar(
    backgroundColor: Colors.white,
    title: Text(txt,style: TextStyle(fontWeight: FontWeight. bold ,fontSize: 30,color: Colors.black),),
    leading: InkWell(
      onTap: image_fun,
      child:Container(
        padding: EdgeInsets.only(left: 10,),
        child: CircleAvatar(
          radius: 60,
          backgroundImage:
          AssetImage(image),
          backgroundColor: Colors.transparent,
        ),
      ) ,
    ),
    actions: [
      Container(
        padding: EdgeInsets.only(right: 10,),
        child: IconButton(onPressed: function1, icon:Icon(icons1),color: Colors.black),
      ),
      Container(
        padding: EdgeInsets.only(right: 20,),
        child: IconButton(onPressed:function2, icon:Icon(icons2),color: Colors.black),
      ),
    ],
  );
}