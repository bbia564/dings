import 'package:get/get.dart';

import 'punch_second_logic.dart';

class PunchSecondBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PunchSecondLogic());
  }
}
