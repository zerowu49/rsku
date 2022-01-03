import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:rsku/page/splash_page.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
        title: 'RSku',
        theme: ThemeData(
          primaryColor: Colors.white,
        ),
        home: SplashPage(),
        builder: EasyLoading.init(),
      );
    });
  }
}
