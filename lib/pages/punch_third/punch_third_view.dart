import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';

import 'punch_third_logic.dart';

class PunchThirdPage extends GetView<PunchThirdLogic> {
  Widget _item(int index, BuildContext context) {
    final titles = ['Clean all records', 'Version'];
    return Container(
      color: Colors.transparent,
      height: 40,
      child: <Widget>[
        Text(titles[index]),
        index == 1 ? const Text("v1.0.0").paddingOnly(right: 10) : const Icon(
          Icons.keyboard_arrow_right,
          size: 20,
          color: Colors.grey,
        )
      ].toRow(mainAxisAlignment: MainAxisAlignment.spaceBetween),
    ).gestures(onTap: () {
      switch (index) {
        case 0:
          controller.cleanPunchData();
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: SafeArea(
            child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: <Widget>[
            const Text(
              'Setting',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.all(12),
              child: <Widget>[_item(0, context), _item(1, context)].toColumn(
                  separator: Divider(
                height: 15,
                color: Colors.grey.withOpacity(0.3),
              )),
            ).decorated(
                border: Border.all(color: const Color(0xffe6e6e6)),
                color: Colors.white,
                borderRadius: BorderRadius.circular(12))
          ].toColumn(crossAxisAlignment: CrossAxisAlignment.start),
        ).marginAll(15)),
      ).decorated(
          gradient: const LinearGradient(
              colors: [Color(0xffecf0f9), Colors.white],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter)),
    );
  }
}
