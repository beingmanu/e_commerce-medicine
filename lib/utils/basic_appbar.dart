import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../main.dart';
import 'basic_navigator.dart';
import 'basic_widgets.dart';

class MyAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final List<Widget>? actions;
  final bool backButton;
  final bool? isLight;
  const MyAppbar(
      {super.key,
      this.title,
      this.actions,
      this.backButton = true,
      this.isLight});
  @override
  Size get preferredSize => const Size.fromHeight(100);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      automaticallyImplyLeading: false,
      centerTitle: true,
      iconTheme: IconThemeData(color: theme.tCDefault),
      leading: backButton
          ? Center(
              child: GestureDetector(
                  onTap: () => navigateBack(context),
                  child: iconButton(icon: FontAwesomeIcons.arrowLeft)))
          : null,
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness:
              isLight ?? theme.darkMode ? Brightness.light : Brightness.dark),
      title: title == null
          ? null
          : Text(
              title!,
              style: theme.text18bold,
            ),
      toolbarHeight: 100,
      actions: actions ?? [],
    );
  }
}
