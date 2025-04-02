import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:punch_in/pages/punch_first/punch_first_logic.dart';
import 'package:punch_in/pages/punch_first/punch_first_view.dart';
import 'package:punch_in/pages/punch_second/punch_second_view.dart';
import 'package:punch_in/pages/punch_third/punch_third_view.dart';

import '../punch_second/punch_second_logic.dart';
import 'punch_tab_logic.dart';

class PunchTabPage extends GetView<PunchTabLogic> {
  const PunchTabPage({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller.pageController,
        children: [
          const PunchFirstPage(),
          PunchSecondPage(),
          PunchThirdPage()
        ],
      ),
      bottomNavigationBar: Obx(()=>_navPunchBars()),
    );
  }

  Widget _navPunchBars() {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: Image.asset('assets/item0Grey.webp',width: 22,height: 22,fit: BoxFit.cover,),
          activeIcon: Image.asset('assets/item0Light.webp',width: 22,height: 22,fit: BoxFit.cover,),
          label: 'Punch',
        ),
        BottomNavigationBarItem(
          icon: Image.asset('assets/item1Grey.webp',width: 22,height: 22,fit: BoxFit.cover,),
          activeIcon: Image.asset('assets/item1Light.webp',width: 22,height: 22,fit: BoxFit.cover,),
          label: 'Record',
        ),
        BottomNavigationBarItem(
          icon: Image.asset('assets/item2Grey.webp',width: 22,height: 22,fit: BoxFit.cover,),
          activeIcon: Image.asset('assets/item2Light.webp',width: 22,height: 22,fit: BoxFit.cover,),
          label: 'Setting',
        ),
      ],
      currentIndex: controller.currentIndex.value,
      onTap: (index) {
        controller.currentIndex.value = index;
        controller.pageController.jumpToPage(index);
        if (index == 0) {
          PunchFirstLogic firstLogic = Get.put(PunchFirstLogic());
          firstLogic.getData();
        } else if (index == 1) {
          PunchSecondLogic secondLogic = Get.put(PunchSecondLogic());
          secondLogic.getData();
        }
      },
    );
  }
}
