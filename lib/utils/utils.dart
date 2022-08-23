import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

String? checkEmail(String string) {
  if (string.isEmpty) {
    return "Your mail is contain empty character";
  }

  const pattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
  final regExp = RegExp(pattern);

  if (!regExp.hasMatch(string)) {
    return "Enter valid mail address";
  }
  return null;
}

String? phoneNumberValidate(String value) {
  String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
  RegExp regExp = RegExp(pattern);
  if (value.isEmpty) {
    return 'Please enter mobile number';
  } else if (!regExp.hasMatch(value)) {
    return 'Please enter valid mobile number';
  }
  return null;
}

Widget editField({
  String? label,
  // String? errorMessage,
  List<TextInputFormatter>? inputFormatter,
  TextInputType? inputType,
  TextEditingController? controller,
}) {
  return TextFormField(
    keyboardType: inputType,
    controller: controller,
    inputFormatters: inputFormatter,
    decoration: InputDecoration(
      labelStyle: TextStyle(
          letterSpacing: 0.8,
          color: Colors.black,
          fontWeight: FontWeight.w400),
      label: Text(label!),
      focusColor: Colors.black,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: const BorderSide(
          color: Colors.black,
          width: 1.0,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: const BorderSide(
          color: Colors.black,
          width: 1.0,
        ),
      ),
    ),
    validator: (txt) {
      return inputType == TextInputType.emailAddress?  checkEmail(txt!) : phoneNumberValidate(txt!);
    },
  );
}

void showMessage(String message, Color colorBackground, context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: colorBackground,
      content: Text(
        message,
        style: TextStyle(letterSpacing: 0.8),
      ),
    ),
  );
}