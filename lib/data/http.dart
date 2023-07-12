import 'package:flutter_hourweather_app/model/weather_data_model.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'dart:convert';

import '../data/controller.dart';


late String lat;
late String lon;

class weatherAPI {
  //Api 요청
  static var client = http.Client();

  static Future<WeatherDataModel?> fetchWeatherData(lat, lon) async {
    String uri =
        'https://api.openweathermap.org/data/2.5/forecast?lat=${lat}&lon=${lon}&appid=${apiKey}&units=metric';

    print('uri');
    print(uri);

    var response = await client.get(Uri.parse(uri));

    Controller controller = Get.find();

    //모델링 데이터 jsondecode
    if (response.statusCode == 200) {
      WeatherDataModel jsonData =
          WeatherDataModel.fromJson(jsonDecode(response.body));
      controller.isLoading(true);
      return (jsonData);
    } else {
      return null;
    }
  }
}
