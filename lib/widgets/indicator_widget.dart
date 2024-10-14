import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;

import '../screens/home/home_screen.dart';

class IndicatorWidget extends StatefulWidget {
  final int totalLength;
  final int currentCarouselPage;
  const IndicatorWidget(
      {super.key,
      required this.currentCarouselPage,
      required this.totalLength});

  @override
  State<IndicatorWidget> createState() => _IndicatorWidgetState();
}

class _IndicatorWidgetState extends State<IndicatorWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: smooth_page_indicator.SmoothPageIndicator(
        controller: PageController(initialPage: widget.currentCarouselPage),
        count: widget.totalLength,
        axisDirection: Axis.horizontal,
        effect: const smooth_page_indicator.ExpandingDotsEffect(
          expansionFactor: 2,
          spacing: 8,
          radius: 10,
          dotWidth: 10,
          dotHeight: 10,
          dotColor: Color(0xFF9E9E9E),
          activeDotColor: Color(0xFF455BC6),
          paintStyle: PaintingStyle.fill,
        ),
      ),
    );
  }
}
