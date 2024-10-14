import 'package:flutter/material.dart';
import 'package:medicine_appp/main.dart';
import 'package:medicine_appp/screens/auth/intro_screen.dart';
import 'package:medicine_appp/screens/auth/login_screen.dart';
import 'package:medicine_appp/screens/home/home_screen.dart';
import 'package:medicine_appp/service/auth_service.dart';
import 'package:medicine_appp/utils/basic_appbar.dart';
import 'package:medicine_appp/utils/basic_widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/basic_navigator.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  ClientAPIService apiService = ClientAPIService();
  @override
  void initState() {
    getcurrentUser();
    super.initState();
  }

  Future<void> getcurrentUser() async {
    final shared = await SharedPreferences.getInstance();
    final String? phnumber = shared.getString("phoneNumber");
    if (phnumber != null && phnumber.length == 10) {
      await apiService.loginCustomer(phnumber, context).then((value) async {
        if (value == true) {
          removeAllAndPush(context, const HomeScreen());
        } else {
          await apiService
              .logOut(context)
              .then((value) => removeAllAndPush(context, const LoginScreen()));
        }
      });
    } else {
      Future.delayed(const Duration(seconds: 2)).then((value) async =>
          await apiService
              .logOut(context)
              .then((value) => removeAllAndPush(context, const IntroScreen())));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: theme.primaryColor,
      appBar: const MyAppbar(
        backButton: false,
        isLight: true,
      ),
      body: Center(child: myText("Medicine app")),
    );
  }
}
