import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:vaksin_kasehat/business_logic/providers/authentication/otp_provider.dart';
import 'package:vaksin_kasehat/business_logic/providers/authentication/phone_authentication_provider.dart';
import 'package:vaksin_kasehat/business_logic/providers/authentication/register_provider.dart';
import 'package:vaksin_kasehat/ui/screens/auth/otp_screen.dart';
import 'package:vaksin_kasehat/ui/screens/auth/register_screen.dart';
import 'package:vaksin_kasehat/ui/screens/screens.dart';
import 'package:vaksin_kasehat/ui/styles/colors.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kasehat Vaksin',
      theme: ThemeData(
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        appBarTheme: AppBarTheme(
          textTheme: GoogleFonts.robotoTextTheme(textTheme),
          elevation: 0,
          color: Colors.white,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
        ),
        textTheme: GoogleFonts.robotoTextTheme(textTheme),
        buttonTheme: ButtonThemeData(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          buttonColor: Color(ColorConstant.mainPalette),
          textTheme: ButtonTextTheme.primary,
        ),
      ),
      initialRoute: SplashScreen.id,
      routes: {
        SplashScreen.id: (context) => SplashScreen(),
        PhoneAuthenticationScreen.id: (context) =>
            ChangeNotifierProvider<PhoneAuthenticationProvider>(
              create: (context) => PhoneAuthenticationProvider(),
              child: PhoneAuthenticationScreen(),
            ),
        OTPScreen.id: (context) => ChangeNotifierProvider<OTPProvider>(
              create: (context) => OTPProvider(),
              child: OTPScreen(),
            ),
        RegisterScreen.id: (context) =>
            ChangeNotifierProvider<RegisterProvider>(
              create: (context) => RegisterProvider(),
              child: RegisterScreen(),
            ),
      },
    );
  }
}
