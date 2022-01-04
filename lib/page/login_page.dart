import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:rsku/page/main_page.dart';
import 'package:rsku/page/register_page.dart';
import 'package:rsku/utils/validation.dart';
import 'package:rsku/widgets/custom_button.dart';
import 'package:sizer/sizer.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  bool _passwordVisible = false;

  Widget _logo() {
    return Image.asset(
      "assets/welcome.jpeg",
      fit: BoxFit.fill,
    );
  }

  Widget _greet() {
    return Text(
      'Welcome back!',
      style: TextStyle(
        fontSize: 20.0.sp,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
      textAlign: TextAlign.center,
    );
  }

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
      textInputAction: TextInputAction.done,
      validator: (password) => Validation().validatePassword(password ?? ''),
    );
  }

  Widget _fieldLogin() {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _usernameInput(),
          SizedBox(height: 2.h),
          _passwordInput(),
        ],
      ),
    );
  }

  Widget _submitButton() {
    return CustomRoundedButton(
      label: 'Login',
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          EasyLoading.show(dismissOnTap: false);
          Future.delayed(Duration(seconds: 2), () {
            EasyLoading.dismiss();
            EasyLoading.showSuccess('Login Success..');
            Get.off(() => MainPage());
          });
        }
      },
    );
  }

  Widget _registerText() {
    return InkWell(
      onTap: () => Get.to(() => RegisterPage()),
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Container(
        child: Text.rich(
          TextSpan(
            text: "New to RSku? ",
            style: TextStyle(
              fontSize: 10.5.sp,
              fontWeight: FontWeight.w400,
            ),
            children: <TextSpan>[
              TextSpan(
                text: "Register Now",
                style: TextStyle(
                  fontSize: 10.5.sp,
                  fontWeight: FontWeight.w400,
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                ),
              ),
            ],
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Login Page"),
        automaticallyImplyLeading: false,
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
                _logo(),
                SizedBox(height: 3.0.h),
                _greet(),
                SizedBox(height: 3.0.h),
                _fieldLogin(),
              ],
            ),
            Column(
              children: [
                _submitButton(),
                SizedBox(height: 3.0.h),
                _registerText(),
                SizedBox(height: 3.0.h),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
