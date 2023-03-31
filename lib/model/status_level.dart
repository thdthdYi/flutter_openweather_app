import 'package:flutter/material.dart';
import 'package:flutter_hourweather_app/model/status_model.dart';

final statusLevel = [
  StatusModel(
      label: '맑음',
      state: 'Sunny',
      weathericon: Icon(
        Icons.sunny,
        color: Color.fromARGB(255, 255, 243, 133),
        size: 40,
      ),
      primaryColor: Color.fromARGB(255, 150, 219, 252)),
  StatusModel(
      label: '맑음',
      state: 'Clear',
      weathericon: Icon(
        Icons.sunny,
        color: Color.fromARGB(255, 255, 243, 133),
        size: 43,
      ),
      primaryColor: Color.fromARGB(255, 158, 221, 250)),
  StatusModel(
      label: '흐림',
      state: 'Clouds',
      weathericon: Icon(
        Icons.cloud,
        color: Colors.grey,
        size: 40,
      ),
      primaryColor: Color.fromARGB(255, 214, 212, 212)),
  StatusModel(
      label: '비',
      state: 'Rain',
      weathericon: Icon(
        Icons.umbrella_rounded,
        color: Colors.grey,
        size: 40,
      ),
      primaryColor: Color.fromARGB(255, 179, 179, 179)),
  StatusModel(
      label: '눈',
      state: 'Snow',
      weathericon: Icon(
        Icons.snowing,
        color: Colors.white,
        size: 40,
      ),
      primaryColor: Color.fromARGB(255, 153, 220, 252)),
];
