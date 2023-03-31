import 'package:flutter/material.dart';
import 'package:flutter_hourweather_app/data/controller.dart';
import 'package:flutter_hourweather_app/model/hourlystat.dart';

import 'package:get/get.dart';

import '../model/status_model.dart';
import '../model/weekstat.dart';

class ScreenCard extends StatelessWidget {
  final Widget child;

  const ScreenCard({required this.child, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
        Radius.circular(16.0),
      )),
      child: child,
    );
  }
}

class CardTitle extends StatelessWidget {
  final String title;

  const CardTitle({required this.title, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.blueAccent[100],
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.0), topRight: Radius.circular(16.0))),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Text(
          title,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
