import 'package:flutter/material.dart';

class OTPProvider extends ChangeNotifier {
  final formKey = GlobalKey<FormState>();
  final otpController = TextEditingController();

  void fnOnSavedOTP(BuildContext context) {
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      return Navigator.pop(
        context,
        otpController.text.trim(),
      );
    }
  }
}
