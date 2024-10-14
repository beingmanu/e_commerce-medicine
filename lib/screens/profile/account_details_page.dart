import 'package:flutter/material.dart';
import 'package:medicine_appp/utils/basic_scaffold.dart';
import 'package:medicine_appp/utils/basic_widgets.dart';

class AccountDetailsPage extends StatefulWidget {
  const AccountDetailsPage({super.key});

  @override
  State<AccountDetailsPage> createState() => _AccountDetailsPageState();
}

class _AccountDetailsPageState extends State<AccountDetailsPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BasicScaffold(
      title: "Account Details",
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            basicSpace(height: 10),
            profileWidgets("Account Holder Name", nameController,
                enable: false),
            basicSpace(height: 10),
            profileWidgets("Mobile Number", phoneController, enable: false),
            basicSpace(height: 10),
            profileWidgets("Email Address", emailController, enable: false)
          ],
        ),
      ),
    );
  }
}
