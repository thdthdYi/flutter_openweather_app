import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/controller.dart';

import 'package:flutter_hourweather_app/screen/screen_appbar.dart';
import '../model/status_level.dart';
import 'daycard.dart';
import 'hourlycard.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Obx(() {
      if (Controller.to.isLoading.value == false) {
        return Center(child: CircularProgressIndicator());
      } else {
        print("start homescreen");
        Controller.to.makedaylist();

        //현재 시간 날씨
        final status = statusLevel
            .where((e) => e.state == Controller.to.today.last)
            .toList();

        final todaystatus = List.generate(
            Controller.to.todayweather.length,
            (index) => statusLevel
                .where((e) => e.state == Controller.to.todayweather[index])
                .toList());

        final weekstatus = List.generate(
            Controller.to.weekList.length,
            (index) => statusLevel
                .where((e) =>
                    e.state == Controller.to.weekList[index].substring(4))
                .toList());

        return Container(
          color: status[0].primaryColor,
          child: CustomScrollView(slivers: [
            ScreenAppBar(status[0]),
            SliverToBoxAdapter(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    //시간별 위젯
                    HourlyCard(todaystatus ?? todaystatus),
                    SizedBox(
                      height: 15.0,
                    ),
                    //날짜별 위젯
                    DayCard(weekstatus ?? weekstatus),
                  ]),
            )
          ]),
        );
      }
    }));
  }
}
