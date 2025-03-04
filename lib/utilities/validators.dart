import 'package:get/get.dart';

class AppValidators {
  AppValidators._();

  static String? validateEmptyField(String? text) {
    if ((text ?? '').isEmpty) {
      return 'Field cannot be empty';
    }
    return null;
  }

  //EMAIL VALIDATOR

  static bool validateMyEmail(String? value) {
    if (value == null || value.isEmpty) {
      return false;
    } else if (!GetUtils.isEmail(value)) {
      return false;
    }
    return true;
  }

  //PASSWORD VALIDATORS
  static String? strongPswdValidator(String? value) {
    RegExp strongPwsdRegex = RegExp(r'^(?=.*?[A-Z])(?=.*?[A-Z]).{6,}$');
    if (value!.isEmpty) {
      return 'Password field must not be empty';
    } else {
      if (!strongPwsdRegex.hasMatch(value)) {
        return 'Not Strong Enough. Must contain: \n- uppercase letter\n- lower case letter\n- Be atleast 6 characters long';
      } else {
        return null;
      }
    }
  }
}
