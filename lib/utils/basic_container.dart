import 'package:flutter/material.dart';
import 'package:medicine_appp/main.dart';

class BasicContainer extends StatefulWidget {
  final Widget child;
  final Color? bgColor;
  const BasicContainer({super.key, required this.child, this.bgColor});

  @override
  State<BasicContainer> createState() => _BasicContainerState();
}

class _BasicContainerState extends State<BasicContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: widget.bgColor ?? theme.colorBG,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: theme.gLightColor)),
        child: widget.child);
  }
}
