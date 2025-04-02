import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:punch_in/db_punch/db_punch.dart';
import 'package:punch_in/db_punch/punch_entity.dart';

class PunchFirstLogic extends GetxController {
  DBPunch dbPunch = Get.find();

  PunchEntity? firstPunchEntity;
  PunchEntity? lastPunchEntity;

  Timer? _timer;

  var currentTimeStr = '-'.obs;
  var mdStr = '-'.obs;

  void startTimer() {
    _timer?.cancel();
    _timer = null;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      currentTimeStr.value = DateFormat('HH:mm:ss').format(DateTime.now());
      final weekDays = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
      mdStr.value =
          '${DateFormat('MM-dd').format(DateTime.now())} ${weekDays[DateTime.now().weekday - 1]}';
    });
  }

  void punch({bool isFist = true}) async {
    final now = DateTime.now();
    final onDuty = DateTime(
        now.year, now.month, now.day, 9, 0, 0);
    final offDuty = DateTime(
        now.year, now.month, now.day, 18, 0, 0);
    if (isFist) {
      if (onDuty.isBefore(now)) {
        lateData();
      } else {
        firstPunchEntity = PunchEntity(
            id: 0,
            createdTime: DateTime.now(),
            type: 0,
            punchTime: DateTime.now());
        await dbPunch.insertPunch(firstPunchEntity!);
        update();
        getData();
      }
    } else {
      if (now.isBefore(offDuty)) {
        lateData(isFirst: false);
      } else {
        if (lastPunchEntity != null) {
          lastPunchEntity = PunchEntity(
              id: lastPunchEntity!.id,
              createdTime: lastPunchEntity!.createdTime,
              type: 1,
              punchTime: DateTime.now());
          await dbPunch.updatePunch(lastPunchEntity!);
        } else {
          lastPunchEntity = PunchEntity(
              id: 0,
              createdTime: DateTime.now(),
              type: 1,
              punchTime: DateTime.now());
          await dbPunch.insertPunch(lastPunchEntity!);
        }
        update();
        getData();
      }

    }
  }

  lateData({bool isFirst = true}) async {
    Get.dialog(AlertDialog(
      title: const Text('Have you clocked in sooner or later?',textAlign: TextAlign.center,),
      actions: [
        TextButton(
          onPressed: () {
            Get.back();
          },
          child: const Text('Cancel',style: TextStyle(color: Colors.black45),),
        ),
        TextButton(
          onPressed: () async {
            if (isFirst) {
              firstPunchEntity = PunchEntity(
                  id: 0,
                  createdTime: DateTime.now(),
                  type: 0,
                  punchTime: DateTime.now());
              await dbPunch.insertPunch(firstPunchEntity!);
            } else {
              if (lastPunchEntity != null) {
                lastPunchEntity = PunchEntity(
                    id: lastPunchEntity!.id,
                    createdTime: lastPunchEntity!.createdTime,
                    type: 1,
                    punchTime: DateTime.now());
                await dbPunch.updatePunch(lastPunchEntity!);
              } else {
                lastPunchEntity = PunchEntity(
                    id: 0,
                    createdTime: DateTime.now(),
                    type: 1,
                    punchTime: DateTime.now());
                await dbPunch.insertPunch(lastPunchEntity!);
              }
            }
            update();
            getData();
            Get.back();
          },
          child: const Text(
            'OK',
            style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
          ),
        ),
      ],
    ));
  }

  void getData() async {
    final result = await dbPunch.getPunchAllData();
    final now = DateTime.now();
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
    startTimer();
    getData();
    super.onInit();
  }
}
