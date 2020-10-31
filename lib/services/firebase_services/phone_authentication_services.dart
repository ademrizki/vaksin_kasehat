import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vaksin_kasehat/ui/screens/auth/otp_screen.dart';
import 'package:vaksin_kasehat/ui/screens/auth/register_screen.dart';

class FirebasePhoneAuthenticationServices {
  Future fnVerifyNumber(String phoneNumber, BuildContext context) async {
    final FirebaseAuth _auth = FirebaseAuth.instance;

    await _auth.verifyPhoneNumber(
      phoneNumber: '+62' + phoneNumber,
      timeout: Duration(seconds: 15),

      /// WHEN CODE HAS BEEN SENT TO DEVICE
      codeSent: (
        String verificationID,
        int resendToken,
      ) async {
        FocusScope.of(context).unfocus();
        final _smsCode = await Navigator.pushNamed(context, OTPScreen.id);

        final PhoneAuthCredential _phoneAuthCredential =
            PhoneAuthProvider.credential(
          verificationId: verificationID,
          smsCode: _smsCode,
        );

        final UserCredential _userCredential =
            await _auth.signInWithCredential(_phoneAuthCredential);

        final User _user = _userCredential.user;

        if (_user == null) {
          print('USER NULL <=============');
        }
        print('done');
        return Navigator.pushNamed(context, RegisterScreen.id);
      },

      /// WHEN VERIFICATION COMPLETED
      verificationCompleted: (PhoneAuthCredential credential) async {
        final UserCredential _userCredential =
            await _auth.signInWithCredential(credential);

        final User _user = _userCredential.user;

        if (_user == null) {
          print('USER NULL <=============');
        }

        print('verified');
        return Navigator.pushNamed(context, RegisterScreen.id);
      },

      /// WHEN VERIFICATION FAILED
      verificationFailed: (FirebaseAuthException e) =>
          print('VERIFICATION ERROR MESSAGE =====> ' + e.message),

      /// WHEN CODE NEED TO RETRIEVE AGAIN
      codeAutoRetrievalTimeout: (String verificationId) {
        print('VERIFICATION ID =====> ' + verificationId);
      },
    );
  }
}
