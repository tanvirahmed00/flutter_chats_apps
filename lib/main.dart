

import 'package:chats_apps/page/login_page.dart';
import 'package:chats_apps/provider/auth_provider.dart';
import 'package:chats_apps/provider/function_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart' as firebase_core;
import 'package:shared_preferences/shared_preferences.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await firebase_core.Firebase.initializeApp();
  runApp( MyApp());
}
class MyApp extends StatefulWidget {


  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
  // systemNavigationBarColor: Colors.red,
  // systemNavigationBarDividerColor: Colors.red,
  // statusBarColor: Colors.red,
  // ));
  @override
  var email;
  shared()async{
    SharedPreferences prefs= await SharedPreferences.getInstance();
    var email =prefs.getString("email");
  }
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => Function_provider()),
          ChangeNotifierProvider(create: (context) => Auth_provider()),
        ],
      child:
      MaterialApp(
        debugShowCheckedModeBanner: false,
        home:Login_page(),
      )
    );
  }
}
