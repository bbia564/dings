import 'package:get/get.dart';

import '../punch_first/punch_first_logic.dart';
import '../punch_second/punch_second_logic.dart';
import '../punch_third/punch_third_logic.dart';
import 'punch_tab_logic.dart';

class PunchTabBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PunchTabLogic());
    Get.lazyPut(() => PunchFirstLogic());
    Get.lazyPut(() => PunchSecondLogic());
    Get.lazyPut(() => PunchThirdLogic());
  }
}
