import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:punch_in/main.dart';
import 'package:styled_widget/styled_widget.dart';

import 'punch_first_logic.dart';

class PunchFirstPage extends GetView<PunchFirstLogic> {
  const PunchFirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PunchFirstLogic>(
        init: PunchFirstLogic(),
        builder: (_) {
          return Scaffold(
            body: Container(
              width: double.infinity,
              height: double.infinity,
              child: <Widget>[
                const SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                ),
                Image.asset(
                  'assets/bg.webp',
                  width: double.infinity,
                  height: 252,
                  fit: BoxFit.cover,
                ),
                SafeArea(
                    child: <Widget>[
                  const SizedBox(
                    height: 20,
                  ),
                  Obx(() {
                    return Text(
                      controller.currentTimeStr.value,
                      style: const TextStyle(
                          fontSize: 42, fontWeight: FontWeight.bold),
                    );
                  }),
                  Obx(() {
                    return Text(
                      controller.mdStr.value,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    );
                  }),
                  const SizedBox(
                    height: 30,
                  ),
                  Expanded(
                      child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(12),
                    child: <Widget>[
                      <Widget>[
                        Expanded(
                            child: Container(
                          padding: const EdgeInsets.all(12),
                          child: <Widget>[
                            <Widget>[
                              const Text('On 09:00'),
                              const SizedBox(
                                width: 5,
                              ),
                              Visibility(
                                visible: controller.firstPunchEntity != null &&
                                    controller.firstPunchEntity?.isOut == true,
                                child: Container(
                                  width: 40,
                                  height: 16,
                                  alignment: Alignment.center,
                                  child: const Text(
                                    'Late',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 10),
                                  ),
                                ).decorated(
                                    color: primaryColor,
                                    borderRadius: BorderRadius.circular(8)),
                              )
                            ].toRow(),
                            controller.firstPunchEntity == null
                                ? const Text(
                                    'No punch in',
                                    style: TextStyle(color: Colors.grey),
                                  )
                                : <Widget>[
                                    Icon(
                                      Icons.check_circle_rounded,
                                      size: 15,
                                      color: primaryColor,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: Text(
                                          '${controller.firstPunchEntity!.punchTimeStr} clocked'),
                                    ),
                                  ].toRow()
                          ].toColumn(
                              crossAxisAlignment: CrossAxisAlignment.start),
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
                            <Widget>[
                              const Text('Off 18:00'),
                              const SizedBox(
                                width: 5,
                              ),
                              Visibility(
                                visible: controller.lastPunchEntity != null &&
                                    controller.lastPunchEntity?.isOut == true,
                                child: Container(
                                  width: 40,
                                  height: 16,
                                  alignment: Alignment.center,
                                  child: const Text(
                                    'Early',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 10),
                                  ),
                                ).decorated(
                                    color: primaryColor,
                                    borderRadius: BorderRadius.circular(8)),
                              )
                            ].toRow(),
                            controller.lastPunchEntity == null
                                ? const Text(
                                    'No punch in',
                                    style: TextStyle(color: Colors.grey),
                                  )
                                : <Widget>[
                                    Icon(
                                      Icons.check_circle_rounded,
                                      size: 15,
                                      color: primaryColor,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: Text(
                                          '${controller.lastPunchEntity!.punchTimeStr} clocked'),
                                    ),
                                  ].toRow()
                          ].toColumn(
                              crossAxisAlignment: CrossAxisAlignment.start),
                        ).decorated(
                                color: const Color(0xfff7f7f7),
                                borderRadius: BorderRadius.circular(6)))
                      ].toRow(),
                      const SizedBox(
                        height: 90,
                      ),
                      Container(
                        width: 182,
                        height: 182,
                        child: <Widget>[
                          Text(
                            controller.firstPunchEntity == null
                                ? 'On duty'
                                : 'Off duty',
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 26,
                                fontWeight: FontWeight.bold),
                          ),
                          Obx(() {
                            return Text(
                              controller.currentTimeStr.value,
                              style: TextStyle(
                                  color: Colors.white.withOpacity(0.5),
                                  fontSize: 20),
                            );
                          })
                        ].toColumn(mainAxisAlignment: MainAxisAlignment.center),
                      )
                          .decorated(
                              color: primaryColor,
                              borderRadius: BorderRadius.circular(182 / 2))
                          .gestures(onTap: () {
                        controller.punch(isFist: controller.firstPunchEntity == null);
                      })
                    ].toColumn(),
                  ).decorated(
                          border: Border.all(color: const Color(0xffe6e6e6)),
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)))
                ].toColumn(
                  crossAxisAlignment: CrossAxisAlignment.start,
                ))
              ].toStack().marginAll(15),
            ).decorated(
                gradient: const LinearGradient(
                    colors: [Color(0xffecf0f9), Colors.white],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter)),
          );
        });
  }
}
