import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:medicine_appp/main.dart';
import 'package:medicine_appp/screens/cart/cart_screen.dart';
import 'package:medicine_appp/screens/home/category_Screen.dart';
import 'package:medicine_appp/screens/home/home_screen.dart';
import 'package:medicine_appp/screens/profile/user_profile_screen.dart';
import 'package:medicine_appp/utils/basic_widgets.dart';

class HomeDashboard extends StatefulWidget {
  const HomeDashboard({super.key});

  @override
  State<HomeDashboard> createState() => _HomeDashboardState();
}

class _HomeDashboardState extends State<HomeDashboard> {
  final PageStorageBucket bucket = PageStorageBucket();
  int currentTab = 1;
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) {
          return;
        } else {
          setState(() => currentTab = 1);
        }
      },
      child: Scaffold(
        extendBody: true,
        bottomNavigationBar: bottomSheeet(
          (value) {
            setState(() => currentTab = value);
          },
        ),
        body: PageStorage(
            bucket: bucket,
            child: currentTab == 0
                ? const HomeScreen()
                : currentTab == 1
                    ? const CategoryScreen()
                    : currentTab == 2
                        ? const MyCartcreen()
                        : const UserProfileScreen()),
      ),
    );
  }

  Widget bottomSheeet(ValueChanged onTap) => Card(
        surfaceTintColor: Colors.transparent,
        color: theme.primaryColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ...List.generate(
                4,
                (index) => CircleAvatar(
                  backgroundColor: theme.primaryColor,
                  child: GestureDetector(
                    onTap: () => onTap(index),
                    child: basicIcon(
                        index == 0
                            ? FontAwesomeIcons.house
                            : index == 1
                                ? FontAwesomeIcons.boxesStacked
                                : index == 2
                                    ? FontAwesomeIcons.cartShopping
                                    : FontAwesomeIcons.solidUser,
                        color: theme.lightColor),
                  ),
                ),
              )
            ],
          ),
        ),
      );
}
