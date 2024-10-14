import 'package:flutter/material.dart';
import 'basic_appbar.dart';

class BasicScaffold extends StatelessWidget {
  final bool showAppbar;
  final String? title;
  final Widget? body;
  final List<Widget>? actions;
  final bool showBack;
  final List<Widget>? bottomWidgets;
  final Widget? floatButton;
  final bool resize;
  final bool extbody;
  final double topPadding;
  final Widget? bottomSheet;

  const BasicScaffold(
      {super.key,
      this.showAppbar = true,
      this.title,
      this.body,
      this.actions,
      this.showBack = true,
      this.bottomWidgets,
      this.floatButton,
      this.resize = false,
      this.bottomSheet,
      this.extbody = false,
      this.topPadding = 120});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      // backgroundColor: theme.colorBG,
      extendBody: true,
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,

      bottomSheet: bottomSheet,
      bottomNavigationBar: bottomWidgets != null
          ? Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: bottomWidgets!,
              ),
            )
          : null,
      floatingActionButton: floatButton,
      appBar: showAppbar
          ? MyAppbar(
              title: title,
              actions: actions,
              backButton: showBack,
            )
          : null,
      body: Container(
        height: size.height,
        width: size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              "https://images.unsplash.com/photo-1647961154167-055527592cbb?q=80&w=1854&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
              // "https://images.unsplash.com/photo-1595763399894-5049284277af?q=80&w=1790&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
              // "https://images.unsplash.com/photo-1564352969906-8b7f46ba4b8b?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: extbody
            ? body
            : Padding(
                padding: EdgeInsets.only(left: 8, right: 8, top: topPadding),
                child: body,
              ),
      ),
    );
  }
}
