import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vaksin_kasehat/business_logic/providers/authentication/phone_authentication_provider.dart';
import 'package:vaksin_kasehat/ui/helpers/space.dart';

class PhoneAuthenticationScreen extends StatelessWidget {
  static const String id = 'PhoneAuthenticationScreen';

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    final _provider =
        Provider.of<PhoneAuthenticationProvider>(context, listen: false);

    return Scaffold(
      body: Container(
        height: _size.height,
        width: _size.width,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 35),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              'Welcome to Kasehat!',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Space(height: 10),
            Text(
              'Insert your phone number to continue :',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
            Space(height: 30),
            SingleChildScrollView(
              child: Form(
                key: _provider.formKey,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Flexible(
                      child: TextFormField(
                        controller: TextEditingController(text: '+62'),
                        readOnly: true,
                        enabled: false,
                      ),
                    ),
                    Space(width: 15),
                    Expanded(
                      flex: 7,
                      child: TextFormField(
                        validator: (String value) => value.length < 8
                            ? 'Please input number properly'
                            : null,
                        controller: _provider.phoneFieldController,
                        decoration:
                            InputDecoration(hintText: 'e.g: 8123456789'),
                        keyboardType: TextInputType.phone,
                        onFieldSubmitted: (_) =>
                            _provider.fnVerifyPhoneNumber(context),
                        textInputAction: TextInputAction.done,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      persistentFooterButtons: <Widget>[
        FlatButton(
          child: Text('SAVE'),
          onPressed: () => _provider.fnVerifyPhoneNumber(context),
        ),
      ],
    );
  }
}
