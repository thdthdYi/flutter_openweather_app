import 'package:flutter/cupertino.dart';

import '../data/controller.dart';
import '../model/status_model.dart';
import '../model/weekstat.dart';
import 'card.dart';

class DayCard extends StatelessWidget {
  final List<List<StatusModel>> modelsList;
  DayCard(this.modelsList, {super.key});

  @override
  Widget build(BuildContext context) {
    int idx = 0;
    return ScreenCard(
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      CardTitle(title: '날짜별 날씨'),
      SizedBox(
          height: 300,
          child: LayoutBuilder(builder: (context, constraint) {
            return ListView(
                scrollDirection: Axis.vertical,
                physics: PageScrollPhysics(),
                children: modelsList
                    .map((item) => Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 4.0),
                          child: Row(
                            children: item
                                .map((e) => Expanded(
                                        child: Weekstat(
                                      height: constraint.maxHeight / 5,
                                      day:
                                          '${Controller.to.weekList[idx++].substring(0, 2)}일',
                                      staticon: e.weathericon,
                                      state: e.state,
                                    )))
                                .toList(),
                          ),
                        ))
                    .toList());
          }))
    ]));
  }
}
