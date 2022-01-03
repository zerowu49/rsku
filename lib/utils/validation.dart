import 'package:get/get.dart';

class Validation {
  String? validateEmail(String email) =>
      RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
              .hasMatch(email)
          ? null
          : 'Invalid Email';

  String? validatePassword(String password) {
    Pattern number = r'^(?=.*?[0-9]+.*)';
    Pattern alphabet = r'(?=.*?[a-zA-Z]+.*)';
    RegExp regex = new RegExp(number as String);

    if (password.isEmpty) {
      return 'Password is empty';
    } else if (password.length < 8) {
      return 'Password must be more than 7 characters';
    } else {
      if (!regex.hasMatch(password)) {
        return 'Password must contain numbers';
      } else {
        regex = new RegExp(alphabet as String);
        if (!regex.hasMatch(password)) {
          return 'Password must contain alphabets';
        }
        return null;
      }
    }
  }

  String? validatePhoneNumber(String val) {
    Pattern firstLetterNumber = r'^(\+62|62|0)8';
    Pattern sixChar = r'^[0-9]{0,10}$';

    RegExp regex = new RegExp(firstLetterNumber as String);
    if (!regex.hasMatch(val)) {
      return 'Invalid phone format'.tr;
    } else {
      regex = new RegExp(sixChar as String);
      if (!regex.hasMatch(val)) {
        return 'Maximal phone number is 10'.tr;
      }
      return null;
    }
  }
}
