import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:letgo_clone_project/view/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        defaultTransition: Transition.native,
        home: Home(),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primaryTextTheme:
                TextTheme(headline6: TextStyle(color: Colors.grey)),
            primaryColor: Colors.redAccent,
            appBarTheme: AppBarTheme(color: Colors.white, centerTitle: true)));
  }
}
