import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:rsku/page/main_page.dart';
import 'package:rsku/utils/validation.dart';
import 'package:rsku/widgets/custom_button.dart';
import 'package:sizer/sizer.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var phoneController = TextEditingController();

  bool _passwordVisible = false;

  Widget _usernameInput() {
    return TextFormField(
      controller: emailController,
      autofocus: true,
      keyboardType: TextInputType.emailAddress,
      style: TextStyle(
        fontSize: 14.0.sp,
        fontWeight: FontWeight.w500,
      ),
      decoration: InputDecoration(
        labelText: "Email",
        labelStyle: TextStyle(
          fontSize: 14.0.sp,
          fontWeight: FontWeight.w400,
          color: Color(0xFF999999),
        ),
        fillColor: Colors.white,
      ),
      textInputAction: TextInputAction.next,
      validator: (email) => Validation().validateEmail(email ?? ''),
    );
  }

  Widget _passwordInput() {
    return TextFormField(
      controller: passwordController,
      keyboardType: TextInputType.text,
      obscureText: !_passwordVisible,
      style: TextStyle(
        fontSize: 14.0.sp,
        fontWeight: FontWeight.w500,
      ),
      decoration: InputDecoration(
        labelText: 'Password',
        labelStyle: TextStyle(
          fontSize: 14.0.sp,
          fontWeight: FontWeight.w400,
          color: Color(0xFF999999),
        ),
        fillColor: Colors.white,
        suffixIcon: IconButton(
          icon: Icon(
            // Based on passwordVisible state choose the icon
            _passwordVisible ? Icons.visibility : Icons.visibility_off,
            color: Theme.of(context).primaryColorDark,
          ),
          onPressed: () {
            // Update the state i.e. toogle the state of passwordVisible variable
            setState(() {
              _passwordVisible = !_passwordVisible;
            });
          },
        ),
      ),
      textInputAction: TextInputAction.next,
      validator: (password) => Validation().validatePassword(password ?? ''),
    );
  }

  Widget _phoneInput() {
    return TextFormField(
      controller: phoneController,
      keyboardType: TextInputType.number,
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp('[0-9]+')),
      ],
      style: TextStyle(
        fontSize: 14.0.sp,
        fontWeight: FontWeight.w500,
      ),
      decoration: InputDecoration(
        labelText: 'Phone Number',
        labelStyle: TextStyle(
          fontSize: 14.0.sp,
          fontWeight: FontWeight.w400,
          color: Color(0xFF999999),
        ),
        fillColor: Colors.white,
      ),
      textInputAction: TextInputAction.done,
      validator: (number) => Validation().validatePhoneNumber(number ?? ''),
    );
  }

  Widget _fieldRegister() {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _usernameInput(),
          SizedBox(height: 2.h),
          _passwordInput(),
          SizedBox(height: 2.h),
          _phoneInput(),
        ],
      ),
    );
  }

  Widget _submitButton() {
    return CustomRoundedButton(
      label: 'Register',
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          EasyLoading.show(dismissOnTap: false);
          Future.delayed(Duration(seconds: 2), () {
            EasyLoading.dismiss();
            EasyLoading.showSuccess('Register success..');
            Get.to(() => MainPage());
          });
        }
      },
    );
  }

  Widget _titleRegister() {
    return Text(
      "Let's get started",
      style: TextStyle(
        fontSize: 16.0.sp,
        fontWeight: FontWeight.bold,
        color: Colors.blue,
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget _descRegister() {
    return Text(
      "Register your account as easy as fill the form",
      style: TextStyle(
        fontSize: 12.0.sp,
        fontWeight: FontWeight.w400,
        color: Colors.black,
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(
          horizontal: 8.w,
          vertical: 2.h,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _titleRegister(),
                SizedBox(height: 3.0.h),
                _descRegister(),
                SizedBox(height: 3.0.h),
                _fieldRegister(),
              ],
            ),
            Column(
              children: [
                _submitButton(),
                SizedBox(height: 3.0.h),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
