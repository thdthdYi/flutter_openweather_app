import 'package:flutter/material.dart';
import 'package:flutter_hourweather_app/model/status_model.dart';

import '../data/controller.dart';
import 'package:get/get.dart';

class ScreenAppBar extends StatelessWidget {
  final StatusModel statusmodel;

  ScreenAppBar(this.statusmodel, {super.key});

  final fontStyle = TextStyle(
      color: Colors.blueGrey, fontSize: 30.0, fontWeight: FontWeight.w700);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
        backgroundColor: statusmodel.primaryColor,
        expandedHeight: 300,
        flexibleSpace: FlexibleSpaceBar(
          background: SafeArea(
              child: Container(
            margin: EdgeInsets.only(top: kToolbarHeight),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '오늘의 날씨',
                  style: fontStyle.copyWith(fontSize: 40.0),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Obx(() {
                  if (Controller.to.isLoading.value == false) {
                    return Center(child: CircularProgressIndicator());
                  } else {
                    return Column(children: [
                      Text('현재 ${DateTime.now().hour}시', style: fontStyle),
                      SizedBox(
                        height: 20.0,
                      ),
                      Container(
                        child: statusmodel.weathericon,
                      ),
                      Text('${statusmodel.state}', style: fontStyle),
                    ]);
                  }
                }),
              ],
            ),
          )),
        ));
  }
}
