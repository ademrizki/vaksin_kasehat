import 'package:flutter/material.dart';
import 'package:vaksin_kasehat/ui/screens/auth/auth.dart';
import 'package:vaksin_kasehat/ui/styles/colors.dart';

class SplashScreen extends StatelessWidget {
  static const String id = 'SplashScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Image.asset('assets/logo/logo-kasehat.png'),
            ),
            FlatButton(
              color: Color(ColorConstant.mainPalette),
              child: Text('Next'),
              onPressed: () =>
                  Navigator.pushNamed(context, PhoneAuthenticationScreen.id),
            ),
          ],
        ),
      ),
    );
  }
}
