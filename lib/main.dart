import 'package:chats_apps/page/botton_navigation_ber.dart';
import 'package:chats_apps/provider/function_provider.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

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
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => Function_provider()),
        ],
      child:
      MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Botton_navig_ber(),
      )

    );


    //   MaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   home: Botton_navig_ber(),
    // )
  }
}
