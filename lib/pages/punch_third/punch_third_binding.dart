import 'package:get/get.dart';

import 'punch_third_logic.dart';

class PunchThirdBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PunchThirdLogic());
  }
}
