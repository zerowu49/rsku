import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class KlinikPage extends StatelessWidget {
  const KlinikPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.local_hospital,
            size: 100,
          ),
          Text(
            "Klinik feature will be available soon",
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
