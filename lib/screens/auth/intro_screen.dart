import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medicine_appp/utils/basic_main_button.dart';
import 'package:medicine_appp/utils/basic_scaffold.dart';

import '../../main.dart';
import '../../utils/basic_navigator.dart';
import '../../utils/basic_widgets.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;

import 'login_screen.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  int currenttab = 0;

  PageController? pageViewController;

  var dataList = [
    {
      "image": "assets/intro1.svg",
      "title": "Scan & Earn: Cash Back Made Easy!",
      "subtitle":
          "Skip the paperwork, scan your paint, and claim your cashback instantly! Paint Scan simplifies the cashback process for retailers, letting you focus on what matters - your customers."
    },
    {
      "image": "assets/intro2.svg",
      "title": "Streamline Cashback Claims with Paint Scan!",
      "subtitle":
          "Say goodbye to complex cashback programs. Paint Scan offers a user-friendly experience with a simple scan-and-claim process for retailers."
    },
    {
      "image": "assets/intro3.svg",
      "title": "Discount on every Purchase",
      "subtitle":
          "Experience the ease of Paint Scan, brought to you by [Your Brand Name]. We empower retailers with a seamless cashback system for a win-win situation."
    }
  ];
  @override
  Widget build(BuildContext context) {
    return BasicScaffold(
      showBack: false,
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: pageViewController ??= PageController(
                initialPage: currenttab,
              ),
              scrollDirection: Axis.horizontal,
              onPageChanged: (value) {
                setState(() {
                  currenttab = value;
                });
              },
              children: List.generate(
                  3,
                  (index) => IntroWidget(
                        title: dataList[index]["title"]!,
                        subtitle: dataList[index]["subtitle"]!,
                        svgImage: dataList[index]["image"]!,
                      )),
            ),
          ),
          Center(
            child: smooth_page_indicator.SmoothPageIndicator(
              controller:
                  pageViewController ?? PageController(initialPage: currenttab),
              count: 3,
              axisDirection: Axis.horizontal,
              onDotClicked: (i) {
                currenttab = i;
                setState(() {});
                pageViewController!.animateToPage(
                  i,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.ease,
                );
              },
              effect: smooth_page_indicator.ExpandingDotsEffect(
                expansionFactor: 2,
                spacing: 8,
                radius: 10,
                dotWidth: 10,
                dotHeight: 10,
                dotColor: theme.tCDefault!,
                activeDotColor: theme.colorButton!,
                paintStyle: PaintingStyle.fill,
              ),
            ),
          ),
          BasicMainButton(
            isLoading: false,
            title: "Next",
            onTap: () => navigateTo(context, const LoginScreen()),
          )
        ],
      ),
    );
  }
}

class IntroWidget extends StatelessWidget {
  final String svgImage;
  final String title;
  final String subtitle;
  const IntroWidget({
    super.key,
    required this.svgImage,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Expanded(child: SizedBox()
            // SvgPicture.asset(svgImage)
            ),
        myText(title, style: theme.text18bold),
        myText(subtitle, style: theme.text14gray)
      ],
    );
  }
}
