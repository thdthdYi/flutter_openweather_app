import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/controller.dart';
import '../model/hourlystat.dart';
import '../model/status_model.dart';
import 'card.dart';

class HourlyCard extends StatelessWidget {
  final List<List<StatusModel>> modelsList;

  HourlyCard(this.modelsList, {super.key});

  @override
  Widget build(BuildContext context) {
    int idx = 0;
    return Obx(() {
      if (Controller.to.isLoading.value == false) {
        return Center(child: CircularProgressIndicator());
      } else {
        return ScreenCard(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CardTitle(title: '시간별 날씨'),
            SizedBox(
                height: 150,
                child: LayoutBuilder(builder: (context, constraint) {
                  return ListView(
                      scrollDirection: Axis.horizontal,
                      physics: PageScrollPhysics(),
                      children: modelsList
                          .map((item) => Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: item
                                    .map((e) => Hourlystat(
                                        width: constraint.maxWidth / 5,
                                        time:
                                            '${Controller.to.timeline[idx++]} 시',
                                        staticon: e.weathericon,
                                        state: e.state,
                                        label: e.label))
                                    .toList(),
                              ))
                          .toList());
                })),
          ],
        ));
      }
    });
  }
}

