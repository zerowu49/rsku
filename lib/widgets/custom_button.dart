import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomRoundedButton extends StatelessWidget {
  final String label;
  final Function() onPressed;
  final bool isFullWidth;

  const CustomRoundedButton({
    Key? key,
    required this.label,
    required this.onPressed,
    this.isFullWidth = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: isFullWidth ? 100.w : null,
      child: TextButton(
        style: TextButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 6.0.w, vertical: 1.5.h),
          backgroundColor: Colors.blue,
          shape: StadiumBorder(),
        ),
        onPressed: onPressed,
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 12.0.sp,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
