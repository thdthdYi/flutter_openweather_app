import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final fontStyle = TextStyle(
    color: Colors.blueGrey, fontSize: 20.0, fontWeight: FontWeight.w700);

class Hourlystat extends StatelessWidget {
  final double width;
  final String time;
  final Icon staticon;
  final String state;
  final String label;

  const Hourlystat(
      {required this.width,
      required this.time,
      required this.staticon,
      required this.state,
      required this.label,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(
          time,
          style: fontStyle,
        ),
        Container(child: staticon),
        Text(
          state,
          style: fontStyle,
        ),
        Text(
          label,
          style: fontStyle,
        )
      ]),
    );
  }
}
