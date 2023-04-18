import 'package:flutter_hourweather_app/data/http.dart';

import 'package:flutter_hourweather_app/model/weather_data_model.dart';
import 'package:flutter_hourweather_app/model/weather_data.dart';
import 'package:get/get.dart';

import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class Controller extends GetxController {
  static Controller get to => Get.find<Controller>();
  var dataList = <WeatherData>[].obs;

  RxBool isLoading = false.obs;

  late String latitude;
  late String longitude;

  late List<WeatherData> weatherData;
  final todayList = [];
  final weekList = [];
  final todayweather = [];
  final today = [];
  final timeline = [];

  @override
  void onInit() async {
    //권한 체크

    await locationPermission();

    //permission = await Geolocator.checkPermission();

/*
    print(permission);
    if (permission == LocationPermission.whileInUse) {
      await getLocation();
      await fetchData();
    } else if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.whileInUse) {
        await getLocation();
        await fetchData();
      } else {
        print('failed');
      }*/
  }

  //to allow current location in first screen
  Future<void> getLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      latitude = position.latitude.toString();
      longitude = position.longitude.toString();
    } catch (e) {
      print('failed getting the current location');
    }
  }

  Future<void> fetchData() async {
    print('latitude');
    print(latitude);
    print('longitude');
    print(longitude);
    WeatherDataModel data = await weatherAPI.fetchWeatherData(
        latitude, longitude) as WeatherDataModel;

    if (data != null) {
      dataList.value = data.list as List<WeatherData>;

      weatherData = data.list as List<WeatherData>;

      isLoading = true.obs;
    }
  }

//today, week weather
  void makedaylist() {
    List<String>? dayList = weatherData
        ?.map((item) =>
            ('${item.dtTxt?.substring(08, 10)}${item.dtTxt?.substring(11, 13)}${item.weather?[0].main}'))
        .toList();

    //week weather
    for (int i = 0; i < dayList!.length; i++) {
      if (dayList[i].substring(2, 4).contains('09')) {
        weekList.add(dayList[i]);
      }
    }

    //today
    for (int i = 0; i < dayList!.length; i++) {
      if (dayList[i].substring(0, 2).contains('${DateTime.now().day}')) {
        todayList.add(dayList[i]);
      }
    }
    for (int i = 0; i < todayList.length; i++) {
      todayweather.add(todayList[i].substring(4));
    }
    //now
    for (int i = 0; i < todayList.length; i++) {
      timeline.add(todayList[i].substring(2, 4));
    }
    for (int i = 0; i < todayList!.length; i++) {
      if (int.parse('${todayList[i].substring(2, 4)}') < DateTime.now().hour ==
          true) {
        today.add(todayList[i].substring(4));
      }
    }
  }

  Future<void> locationPermission() async {
    Map<Permission, PermissionStatus> status =
        await [Permission.location].request();

    if (status[Permission.location] == PermissionStatus.granted) {
      await getLocation();
      await fetchData();
    } else if (status[Permission.location] == PermissionStatus.denied) {
      await locationPermission();

      if (status[Permission.location] == PermissionStatus.granted) {
        await getLocation();
        await fetchData();
      } else {
        print('failed');
      }
    }
  }
}
