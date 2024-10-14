import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:medicine_appp/main.dart';
import 'package:medicine_appp/utils/basic_widgets.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.width * .45,
      width: size.width * .45,
      padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: theme.colorBG,
          border: Border.all(color: theme.gLightColor),
          borderRadius: BorderRadius.circular(20)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: Center(
              child: basicIcon(FontAwesomeIcons.houseMedicalCircleExclamation),
            ),
          ),
          myText("Category")
        ],
      ),
    );
  }
}
