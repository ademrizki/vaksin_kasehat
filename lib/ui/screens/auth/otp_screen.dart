import 'package:flutter/material.dart';
import 'package:pin_input_text_field/pin_input_text_field.dart';
import 'package:provider/provider.dart';
import 'package:vaksin_kasehat/business_logic/providers/authentication/otp_provider.dart';
import 'package:vaksin_kasehat/ui/helpers/space.dart';

class OTPScreen extends StatelessWidget {
  static const String id = 'OTPScreen';

  @override
  Widget build(BuildContext context) {
    final _provider = Provider.of<OTPProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                'Insert your OTP',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Space(height: 50),
              SingleChildScrollView(
                child: Form(
                  key: _provider.formKey,
                  child: PinInputTextFormField(
                    validator: (String value) =>
                        value.isEmpty ? 'Please, fill every field.' : null,
                    controller: _provider.otpController,
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.go,
                    pinLength: 6,
                    onSubmit: (_) => _provider.fnOnSavedOTP(context),
                  ),
                ),
              ),
              Space(height: 10),
              RaisedButton(
                child: Text('SAVE'),
                onPressed: () => _provider.fnOnSavedOTP(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
