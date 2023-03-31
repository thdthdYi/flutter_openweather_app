import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final fontStyle = TextStyle(
    color: Colors.blueGrey, fontSize: 15.0, fontWeight: FontWeight.w700);

class Weekstat extends StatelessWidget {
  final String day;
  final double height;
  final Icon staticon;
  final String state;

  const Weekstat(
      {required this.day,
      required this.height,
      required this.staticon,
      required this.state,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Center(
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          Text(
            day,
            style: fontStyle,
          ),
          Container(child: staticon),
          Text(
            state,
            style: fontStyle,
          ),
        ]),
      ),
    );
  }
}
