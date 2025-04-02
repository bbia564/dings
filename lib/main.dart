import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:punch_in/db_punch/db_punch.dart';
import 'package:punch_in/pages/no_network/no_network_binding.dart';
import 'package:punch_in/pages/no_network/no_network_view.dart';
import 'package:punch_in/pages/punch_first/punch_first_binding.dart';
import 'package:punch_in/pages/punch_first/punch_first_view.dart';
import 'package:punch_in/pages/punch_moke/punch_moke_binding.dart';
import 'package:punch_in/pages/punch_moke/punch_moke_view.dart';
import 'package:punch_in/pages/punch_second/punch_second_binding.dart';
import 'package:punch_in/pages/punch_second/punch_second_view.dart';
import 'package:punch_in/pages/punch_tab/punch_tab_binding.dart';
import 'package:punch_in/pages/punch_tab/punch_tab_view.dart';
import 'package:punch_in/pages/punch_third/punch_third_binding.dart';
import 'package:punch_in/pages/punch_third/punch_third_view.dart';

import 'db_punch/db_init.dart';

Color primaryColor = const Color(0xff0089ff);
Color bgColor = Colors.white;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await Get.putAsync(() => DBPunch().init());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: Dings,
      initialRoute: '/',
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: primaryColor,
        scaffoldBackgroundColor: bgColor,
        colorScheme: ColorScheme.light(
          primary: primaryColor,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          scrolledUnderElevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 20,
          ),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: primaryColor,
          selectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        cardTheme: const CardTheme(
          color: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        dialogTheme: const DialogTheme(
          actionsPadding: EdgeInsets.only(right: 10, bottom: 5),
        ),
        dividerTheme: DividerThemeData(
          thickness: 1,
          color: Colors.grey[200],
        ),
      ),
    );
  }
}
List<GetPage<dynamic>> Dings = [
  GetPage(name: '/', page: () => const PunchMokeView(), binding: PunchMokeBinding()),
  GetPage(name: '/systemError', page: () => NoNetworkPage(), binding: NoNetworkBinding()),
  GetPage(name: '/punchFirst', page: () => const PunchFirstPage(), binding: PunchFirstBinding()),
  GetPage(name: '/punchSecond', page: () => PunchSecondPage(), binding: PunchSecondBinding()),
  GetPage(name: '/punchInit', page: () => const DbInit()),
  GetPage(name: '/punchThird', page: () => PunchThirdPage(), binding: PunchThirdBinding()),
  GetPage(name: '/punchTab', page: () => const PunchTabPage(), binding: PunchTabBinding()),
];