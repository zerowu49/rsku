import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class RsPage extends StatelessWidget {
  const RsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.local_hotel,
            size: 100,
          ),
          Text(
            "RS feature will be available soon",
            style: TextStyle(
              fontSize: 14.0.sp,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
