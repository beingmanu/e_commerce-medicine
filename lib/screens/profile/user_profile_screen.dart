import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:medicine_appp/main.dart';
import 'package:medicine_appp/model/user_details.dart';
import 'package:medicine_appp/provider/user_provider.dart';
import 'package:medicine_appp/screens/profile/account_details_page.dart';
import 'package:medicine_appp/screens/profile/addresses_page.dart';
import 'package:medicine_appp/screens/profile/orders_page.dart';
import 'package:medicine_appp/screens/profile/payment_details_page.dart';
import 'package:medicine_appp/utils/basic_container.dart';
import 'package:medicine_appp/utils/basic_navigator.dart';
import 'package:medicine_appp/utils/basic_scaffold.dart';
import 'package:medicine_appp/utils/basic_widgets.dart';
import 'package:provider/provider.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  late UserData user;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    user = Provider.of<UserProvider>(context).userInformation;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BasicScaffold(
      title: "Profile",
      showBack: false,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: size.width * .4,
              width: size.width,
              child: Row(
                children: [
                  CircleAvatar(
                    radius: size.width * .1,
                    backgroundColor: theme.primaryColor,
                    child: basicIcon(FontAwesomeIcons.user,
                        color: theme.lightColor),
                  ),
                  basicSpace(width: 15),
                  Flexible(
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          myText("${user.firstName} ${user.lastName}",
                              style: theme.text16bold, padding: 0),
                          myText("${user.email}",
                              style: theme.text14gray, padding: 0)
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            BasicContainer(
                child: Column(
              children: [
                profileOption("Account Details",
                    () => navigateTo(context, const AccountDetailsPage())),
                profileOption("Your Oders",
                    () => navigateTo(context, const OrdersPage())),
                profileOption("Addresses",
                    () => navigateTo(context, const AddressesPage())),
                profileOption("Payments",
                    () => navigateTo(context, const PaymentDetailsPage())),
                profileOption("Log Out", () {}),
              ],
            )),
            basicSpace(height: 20),
            myText("FAQs"),
            basicSpace(height: 10),
            myText("About Us"),
            basicSpace(height: 10),
            myText("Terms of Use"),
            basicSpace(height: 10),
            myText("Privacy Policy"),
            basicSpace(height: 10),
            myText("cancellation policy"),
          ],
        ),
      ),
    );
  }

  Widget profileOption(String title, VoidCallback onTap) => ListTile(
        title: myText(title,
            align: TextAlign.start, style: theme.text16, padding: 0),
        trailing: basicIcon(FontAwesomeIcons.circleArrowRight),
        onTap: onTap,
      );
}
