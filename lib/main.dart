import 'package:flutter/material.dart';
import 'screen/homescreen.dart';
import 'package:get/get.dart';
import 'data/controller.dart';

void main() {
  Get.put(Controller());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather app',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'sunflower',
      ),
      home: HomeScreen(),
    );
  }
}
