import 'package:chats_apps/page/chat_page.dart';
import 'package:chats_apps/page/profile_page.dart';
import 'package:chats_apps/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class Botton_navig_ber extends StatefulWidget {
  const Botton_navig_ber({Key? key}) : super(key: key);

  @override
  State<Botton_navig_ber> createState() => _Botton_navig_berState();
}

class _Botton_navig_berState extends State<Botton_navig_ber> {
  var curntdex = 0;
  List curPage = [
    chat_pages(

    ),
    profile_pages(),
    // profire(),

  ];
  @override
  Widget build(BuildContext context) {
    final Auth_provider auth_provider = Provider.of<Auth_provider>(context);
    return Scaffold(

      bottomNavigationBar: BottomNavigationBar(
          currentIndex: curntdex,
          selectedItemColor: Colors.black,
          backgroundColor: Colors.white,
          showSelectedLabels: true,
          onTap: (Index) {
            setState(() {
              curntdex = Index;
            });
          },
          items: [
            BottomNavigationBarItem(
                tooltip: "home", icon: Icon(Icons.home),label: "Chats",
            ),
            BottomNavigationBarItem(
                tooltip: "camera",
                icon: Icon(Icons.person_rounded),label: 'Profile',
            ),

          ]),
      body:Center(
          child:curPage[curntdex]
      ),


    );
  }
  // Widget profire(context,index,Auth_provider auth_provider){
  //   return InkWell(
  //
  //   );
  // }
}
