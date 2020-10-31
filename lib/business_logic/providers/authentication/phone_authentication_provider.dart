import 'package:flutter/material.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:vaksin_kasehat/services/firebase_services/phone_authentication_services.dart';

class PhoneAuthenticationProvider extends ChangeNotifier
    with FirebasePhoneAuthenticationServices {
  final phoneFieldController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  Future fnVerifyPhoneNumber(BuildContext context) async {
    final _progressDialog = ProgressDialog(context);

    if (formKey.currentState.validate()) {
      await _progressDialog.show();
      formKey.currentState.save();
      await super.fnVerifyNumber(phoneFieldController.text.trim(), context);
      await _progressDialog.hide();
    }
    await _progressDialog.hide();
  }
}
