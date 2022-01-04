import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rsku/page/login_page.dart';
import 'package:sizer/sizer.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  bool isFetching = false;

  @override
  void initState() {
    Future.delayed(Duration(seconds: 2), () {
      // Show description
      setState(() {
        isFetching = true;
      });

      // Redirect to login page
      Future.delayed(Duration(seconds: 3), () {
        Get.off(() => LoginPage());
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Image.asset("assets/logo.png"),
            ),
            if (isFetching)
              Column(
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 2.0.h),
                  Text(
                    "Fetching your profile",
                    style: TextStyle(
                      fontSize: 12.0.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                ],
              )
          ],
        ),
      ),
    );
  }
}
