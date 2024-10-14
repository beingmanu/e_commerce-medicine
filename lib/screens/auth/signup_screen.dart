import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:medicine_appp/screens/home/home_screen.dart';
import 'package:medicine_appp/utils/basic_main_button.dart';
import 'package:medicine_appp/utils/basic_navigator.dart';
import 'package:medicine_appp/utils/basic_scaffold.dart';
import 'package:medicine_appp/utils/basic_widgets.dart';

import '../../main.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController phoneC = TextEditingController();
  TextEditingController nameC = TextEditingController();
  TextEditingController emailC = TextEditingController();
  TextEditingController doBC = TextEditingController();

  DateTime currentDate = DateTime.now();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return BasicScaffold(
      title: "Sign Up",
      showBack: false,
      bottomWidgets: [
        BasicMainButton(
            onTap: () => navigateTo(context, const HomeScreen()),
            isLoading: isLoading,
            title: "Register")
      ],
      body: SingleChildScrollView(
        child: Column(
          children: [
            textTile("Your Name", nameC, FontAwesomeIcons.solidUser,
                input: TextInputType.name),
            textTile("Mobile Number", phoneC, FontAwesomeIcons.mobile,
                input: TextInputType.number),
            textTile("Email", emailC, FontAwesomeIcons.solidEnvelope,
                input: TextInputType.emailAddress),
            textTile(
              "Date of Birth",
              doBC,
              FontAwesomeIcons.calendar,
              input: TextInputType.datetime,
              onTap: () => datePicker(context),
            )
          ],
        ),
      ),
    );
  }

  Widget textTile(String hint, TextEditingController controller, IconData icon,
          {TextInputType? input, VoidCallback? onTap}) =>
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            myText(hint, padding: 0),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: theme.gLightColor),
                  borderRadius: BorderRadius.circular(50)),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: TextField(
                controller: controller,
                style: theme.text16,
                keyboardType: input,
                onTap: onTap,
                readOnly: onTap == null ? false : true,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: hint,
                  hintStyle: theme.text14gray,
                  prefixIcon: Center(
                    widthFactor: 1,
                    child: basicIcon(icon),
                  ),
                ),
              ),
            ),
          ],
        ),
      );

  datePicker(context) async {
    DateTime? userSelectedDate = await showDatePicker(
      context: context,
      initialDate: currentDate,
      firstDate: DateTime(1800),
      lastDate: DateTime.now(),
      keyboardType: TextInputType.datetime,
      initialDatePickerMode: DatePickerMode.year,
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: theme.darkMode
              ? ThemeData.dark().copyWith(
                  datePickerTheme: DatePickerThemeData(
                    backgroundColor: theme.colorBG,
                    headerBackgroundColor: theme.colorBG,
                    surfaceTintColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    yearStyle: theme.text16,
                    dayStyle: theme.text14,
                    headerHelpStyle: theme.text18bold,
                    headerHeadlineStyle: theme.text14,
                    todayForegroundColor:
                        MaterialStatePropertyAll(theme.tCDefault),
                  ),
                  primaryColor: theme.colorButton,
                  dialogBackgroundColor: theme.colorBG,
                  colorScheme: ColorScheme.dark(primary: theme.colorButton!)
                      .copyWith(secondary: theme.colorButton))
              : ThemeData.light().copyWith(
                  datePickerTheme: DatePickerThemeData(
                    backgroundColor: theme.colorBG,
                    headerBackgroundColor: theme.colorBG,
                    surfaceTintColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    yearStyle: theme.text16,
                    dayStyle: theme.text14,
                    headerHelpStyle: theme.text18bold,
                    headerHeadlineStyle: theme.text14,
                    todayForegroundColor:
                        MaterialStatePropertyAll(theme.tCDefault),
                  ),
                  primaryColor: theme.colorButton,
                  buttonTheme:
                      const ButtonThemeData(textTheme: ButtonTextTheme.primary),
                  dialogBackgroundColor: theme.colorBG,
                  colorScheme: ColorScheme.light(primary: theme.colorButton!)
                      .copyWith(secondary: theme.colorButton)),
          child: child!,
        );
      },
    );

    if (userSelectedDate == null) {
    } else {
      setState(() {
        currentDate = userSelectedDate;
        doBC.text = DateFormat('d MMM y').format(currentDate);
      });
    }
  }
}
