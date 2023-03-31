import 'package:flutter/cupertino.dart';

class StatusModel {
  final String label;
  final String state;
  final Icon weathericon;
  final Color primaryColor;

  StatusModel(
      {required this.label,
      required this.state,
      required this.weathericon,
      required this.primaryColor});
}
