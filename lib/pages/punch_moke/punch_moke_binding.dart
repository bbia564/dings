import 'package:get/get.dart';

import 'punch_moke_logic.dart';

class PunchMokeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
      PageLogic(),
      permanent: true,
    );
  }
}
