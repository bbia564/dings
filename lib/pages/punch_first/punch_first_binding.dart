import 'package:get/get.dart';

import 'punch_first_logic.dart';

class PunchFirstBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PunchFirstLogic());
  }
}
