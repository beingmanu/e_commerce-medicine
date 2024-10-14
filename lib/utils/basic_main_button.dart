import 'package:flutter/material.dart';

import '../main.dart';
import 'basic_widgets.dart';

class BasicMainButton extends StatefulWidget {
  final VoidCallback onTap;
  final bool isLoading;
  final String title;
  final double? hPadding;
  const BasicMainButton(
      {super.key,
      required this.onTap,
      required this.isLoading,
      required this.title,
      this.hPadding});

  @override
  State<BasicMainButton> createState() => _BasicMainButtonState();
}

class _BasicMainButtonState extends State<BasicMainButton> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        height: 40,
        margin: EdgeInsets.symmetric(
            horizontal: widget.hPadding ?? size.width * .08, vertical: 5),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: theme.primaryColor, borderRadius: BorderRadius.circular(50)),
        child: widget.isLoading
            ? circleLoader()
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: myText(
                  widget.title,
                  style: theme.text18bold!.copyWith(color: theme.tCReverse),
                ),
              ),
      ),
    );
  }
}
