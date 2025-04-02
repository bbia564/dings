import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:punch_in/main.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:table_calendar/table_calendar.dart';

import 'punch_second_logic.dart';

class PunchSecondPage extends GetView<PunchSecondLogic> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PunchSecondLogic>(
        init: PunchSecondLogic(),
        builder: (_) {
          return Scaffold(
            body: Container(
              width: double.infinity,
              height: double.infinity,
              child: SafeArea(
                  child: <Widget>[
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(8),
                  child: TableCalendar(
                    firstDay: DateTime.utc(2010, 10, 16),
                    lastDay: DateTime.utc(2030, 3, 14),
                    focusedDay: DateTime.now(),
                    calendarFormat: controller.calendarFormat,
                    onFormatChanged: (format) {
                      if (controller.calendarFormat != format) {
                        controller.calendarFormat = format;
                        controller.update();
                      }
                    },
                    currentDay: controller.currentDate,
                    calendarStyle: const CalendarStyle(
                      todayDecoration: BoxDecoration(
                          color: Color(0xff0089ff), shape: BoxShape.circle),
                    ),
                    onDaySelected: (selectedDay, focusedDay) {
                      controller.currentDate = selectedDay;
                      controller.update();
                      controller.getData();
                    },
                  ),
                ).decorated(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    border: Border.all(color: const Color(0xffe6e6e6))),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  child: <Widget>[
                    Expanded(
                        child: Container(
                      padding: const EdgeInsets.all(12),
                      child: <Widget>[
                        Visibility(
                          visible: controller.firstPunchEntity != null &&
                              controller.firstPunchEntity?.isOut == true,
                          child: Text(
                            'Late',
                            style: TextStyle(
                                color: primaryColor,
                                fontSize: 12,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        const Text(
                          'On 09:00',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        controller.firstPunchEntity == null
                            ? const Text(
                                'No punch in',
                                style: TextStyle(color: Colors.grey),
                              )
                            : Text(
                                '${controller.firstPunchEntity!.punchTimeStr} clocked',
                                style: const TextStyle(color: Colors.grey),
                              )
                      ].toColumn(crossAxisAlignment: CrossAxisAlignment.start),
                    ).decorated(
                            color: const Color(0xfff7f7f7),
                            borderRadius: BorderRadius.circular(6))),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: Container(
                      padding: const EdgeInsets.all(12),
                      child: <Widget>[
                        Visibility(
                          visible: controller.lastPunchEntity != null &&
                              controller.lastPunchEntity?.isOut == true,
                          child: Text(
                            'Early',
                            style: TextStyle(
                                color: primaryColor,
                                fontSize: 12,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        const Text(
                          'Off 18:00',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        controller.lastPunchEntity == null
                            ? const Text(
                                'No punch in',
                                style: TextStyle(color: Colors.grey),
                              )
                            : Text(
                                '${controller.lastPunchEntity!.punchTimeStr} clocked',
                                style: const TextStyle(color: Colors.grey),
                              )
                      ].toColumn(crossAxisAlignment: CrossAxisAlignment.start),
                    ).decorated(
                            color: const Color(0xfff7f7f7),
                            borderRadius: BorderRadius.circular(6))),
                  ].toRow(),
                ).decorated(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    border: Border.all(color: const Color(0xffe6e6e6)))
              ].toColumn().marginAll(15)),
            ).decorated(
                gradient: const LinearGradient(
                    colors: [Color(0xffecf0f9), Colors.white],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter)),
          );
        });
  }
}
