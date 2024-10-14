import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:medicine_appp/screens/auth/signup_screen.dart';
import 'package:medicine_appp/utils/basic_main_button.dart';
import 'package:medicine_appp/utils/basic_navigator.dart';
import 'package:medicine_appp/utils/basic_scaffold.dart';
import 'package:pinput/pinput.dart';

import '../../main.dart';
import '../../utils/basic_toast.dart';
import '../../utils/basic_widgets.dart';

class OtpScreen extends StatefulWidget {
  final String phone;
  const OtpScreen({super.key, required this.phone});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final TextEditingController codeController = TextEditingController();
  FocusNode focusNode = FocusNode();
  // AuthService authService = AuthService();

  bool isloadafteropt = false;
  bool isLoading = false;

  var verifyId;

  Timer? _timer;
  int _remainingTime = 0;

  @override
  void initState() {
    super.initState();
    // verifyphone();
  }

  verifyphone() async {
    setState(() {
      isLoading = true;
    });
    try {
      verificationCompleted(PhoneAuthCredential phoneAuthCredential) async {
        setState(() {
          isLoading = false;
        });
      }

      verificationFailed(FirebaseAuthException authException) {
        setState(() {
          isLoading = false;
        });
        showToast('Phone verification failed:\n$authException');
        Navigator.pop(context);
      }

      codeSent(String verificationId, int? forceResendingToken) async {
        verifyId = verificationId;
        _startTimer(60);
        setState(() {
          isLoading = false;
        });
      }

      codeAutoRetrievalTimeout(String verificationId) {
        verifyId = verificationId;
      }

      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: "+91${widget.phone}",
        verificationCompleted: verificationCompleted,
        verificationFailed: verificationFailed,
        codeSent: codeSent,
        codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
      );
    } on FirebaseAuthException catch (e) {
      setState(() {
        isLoading = false;
      });
      showToast(e.message!);
    }
  }

  void _startTimer(int time) {
    _remainingTime = time;
    _timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      if (_remainingTime > 0) {
        setState(() {
          _remainingTime--;
        });
      } else {
        _timer?.cancel();
      }
    });
  }

  @override
  void dispose() {
    codeController.dispose();
    focusNode.dispose();
    _timer?.cancel();
    isLoading = false;
    isloadafteropt = false;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final focusedBorderColor = theme.colorButton;

    final defaultPinTheme = PinTheme(
      width: 45,
      height: 45,
      textStyle: theme.text16,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(19),
        border: Border.all(color: theme.tCDefault!),
      ),
    );
    return BasicScaffold(
      title: "Verify your Number",
      showBack: false,
      bottomWidgets: [
        BasicMainButton(
            onTap: () => navigateTo(context, const SignupScreen()),
            isLoading: isloadafteropt,
            title: "Log In")
      ],
      body: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          basicSpace(height: 40),
          myText("We Sent OTP Code to Verify Your Number",
              style: theme.text16bold),
          myText(widget.phone,
              style: theme.text14, padding: 0, align: TextAlign.center),
          Center(
            child: GestureDetector(
              onTap: () => navigateBack(context),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  myText("Change Number",
                      style: theme.text14!.copyWith(color: theme.primaryColor),
                      padding: 0,
                      align: TextAlign.center),
                  basicIcon(FontAwesomeIcons.penToSquare,
                      size: 14, color: theme.primaryColor)
                ],
              ),
            ),
          ),
          basicSpace(height: 40),
          // verifyId == "" || isLoading
          //     ? Center(child: circleLoader())
          //     :
          Directionality(
            textDirection: TextDirection.ltr,
            child: Pinput(
              controller: codeController,
              focusNode: focusNode,
              length: 6,
              enabled: !isloadafteropt,
              defaultPinTheme: defaultPinTheme,
              separatorBuilder: (index) => const SizedBox(width: 8),
              onCompleted: (pin) {},
              onChanged: (value) {},
              cursor: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 9),
                    width: 22,
                    height: 1,
                    color: focusedBorderColor,
                  ),
                ],
              ),
              focusedPinTheme: defaultPinTheme.copyWith(
                decoration: defaultPinTheme.decoration!.copyWith(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: focusedBorderColor!),
                ),
              ),
              submittedPinTheme: defaultPinTheme.copyWith(
                decoration: defaultPinTheme.decoration!.copyWith(
                  color: theme.companionColor01,
                  borderRadius: BorderRadius.circular(19),
                  border: Border.all(color: focusedBorderColor),
                ),
              ),
              errorPinTheme: defaultPinTheme.copyBorderWith(
                border: Border.all(color: Colors.redAccent),
              ),
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              myText("Didn't receive an OTP? ", style: theme.text16),
              _remainingTime != 0
                  ? Text(
                      "00:$_remainingTime",
                      style: theme.text16bold,
                    )
                  : GestureDetector(
                      onTap: () {
                        setState(() {
                          isLoading = true;
                        });
                        verifyphone();
                      },
                      child: myText("Resend OTP", style: theme.text16bold)),
            ],
          ),
        ],
      ),
    );
  }
}
