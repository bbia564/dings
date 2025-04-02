import 'package:get/get.dart';
import 'package:punch_in/db_punch/db_punch.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../db_punch/punch_entity.dart';

class PunchSecondLogic extends GetxController {

  DBPunch dbPunch = Get.find();

  PunchEntity? firstPunchEntity;
  PunchEntity? lastPunchEntity;

  CalendarFormat calendarFormat = CalendarFormat.month;
  var currentDate = DateTime.now();

  void getData() async {
    final result = await dbPunch.getPunchAllData();
    final now = currentDate;
    final todayResult = result
        .where((e) =>
    e.punchTime.year == now.year &&
        e.punchTime.month == now.month &&
        e.punchTime.day == now.day)
        .toList();
    firstPunchEntity = todayResult.where((e) => e.type == 0).firstOrNull;
    lastPunchEntity = todayResult.where((e) => e.type == 1).firstOrNull;
    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    getData();
    super.onInit();
  }

}
