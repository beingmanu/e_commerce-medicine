import 'package:flutter/material.dart';
import 'package:medicine_appp/main.dart';
import 'package:medicine_appp/screens/auth/signup_screen.dart';
import 'package:medicine_appp/screens/home/home_screen.dart';
import 'package:medicine_appp/service/auth_service.dart';
import 'package:medicine_appp/utils/basic_main_button.dart';
import 'package:medicine_appp/utils/basic_navigator.dart';
import 'package:medicine_appp/utils/basic_scaffold.dart';
import 'package:medicine_appp/utils/basic_toast.dart';
import 'package:medicine_appp/utils/basic_widgets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  ClientAPIService authService = ClientAPIService();

  bool isLoading = false;

  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BasicScaffold(
      showBack: false,
      extbody: true,
      resize: true,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Spacer(),
          Container(
            height: size.height * .6,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: Column(
                children: [
                  const Spacer(),
                  textTile("Mobile Number", phoneController),
                  textTile("Password", passwordController),
                  const Spacer(),
                  BasicMainButton(
                      onTap: () async {
                        if (phoneController.text == "" ||
                            phoneController.text.length != 10) {
                          showToast("Please enter valid mobile number!");
                          return;
                        }
                        setState(() => isLoading = true);
                        await authService
                            .loginCustomer(phoneController.text, context)
                            .then(
                          (value) async {
                            if (value == true) {
                              removeAllAndPush(context, const HomeScreen());
                            } else {
                              return;
                            }
                          },
                        );
                      },
                      isLoading: isLoading,
                      title: "Login"),
                  myText("Or"),
                  GestureDetector(
                      onTap: () => navigateTo(context, const SignupScreen()),
                      child: myText("Sign Up", style: theme.text16bold)),
                  basicSpace(height: 10)
                ],
              ),
            ),
          ),
          basicSpace(height: size.height * .1)
        ],
      ),
    );
  }

  Widget textTile(String hint, TextEditingController controller) => Container(
        margin: const EdgeInsets.all(30),
        decoration: BoxDecoration(
            border: Border.all(color: theme.gLightColor),
            borderRadius: BorderRadius.circular(50)),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: TextField(
          controller: controller,
          style: theme.text16,
          keyboardType: TextInputType.phone,
          decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hint,
              hintStyle: theme.text14gray,
              prefixText: "+91 ",
              prefixStyle: theme.text16!.copyWith(color: theme.gLightColor)),
        ),
      );
}
