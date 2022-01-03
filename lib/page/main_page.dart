import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Valbury'),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(
          horizontal: 8.w,
          vertical: 2.h,
        ),
        child: Text("Main Page"),
      ),
    );
  }
}
