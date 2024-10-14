import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../main.dart';
import '../screens/home/home_screen.dart';
import 'basic_container.dart';

Widget myText(String text,
        {TextAlign align = TextAlign.start,
        TextOverflow overflow = TextOverflow.ellipsis,
        TextStyle? style,
        int maxLine = 10,
        double padding = 0.0}) =>
    Padding(
      padding: EdgeInsets.all(padding),
      child: Text(
        text,
        textAlign: align,
        style: style ?? theme.text16,
        overflow: overflow,
        softWrap: true,
        maxLines: maxLine,
      ),
    );

Widget circleLoader({
  Colors? color,
  double width = 1.5,
}) {
  return CircularProgressIndicator(
    color: theme.tCDefault,
    strokeWidth: width,
  );
}

Widget basicSpace({double? height, double? width}) => SizedBox(
      height: height,
      width: width,
    );

Widget basicIcon(IconData? icon,
        {double? size = 18, Color? color, double pad = 5.0}) =>
    Padding(
      padding: EdgeInsets.all(pad),
      child: FaIcon(
        icon,
        color: color ?? theme.tCDefault,
        size: size,
      ),
    );

Widget showHDivider({double hpadding = 15}) => Container(
      height: 2,
      margin: EdgeInsets.symmetric(horizontal: hpadding, vertical: 10),
      decoration: BoxDecoration(
          color: theme.tCGray, borderRadius: BorderRadius.circular(5)),
    );

Widget showVDivider() => Container(
      width: 2,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
          color: theme.tCGray, borderRadius: BorderRadius.circular(5)),
    );

Widget iconButton(
        {IconData? icon,
        VoidCallback? onTap,
        String? imagePath,
        double? size,
        String? title}) =>
    GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(5),
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: Colors.transparent,
            border: Border.all(color: theme.tCGray!),
            borderRadius: BorderRadius.circular(15)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon != null
                ? basicIcon(icon, color: theme.tCDefault, size: size)
                : SizedBox(
                    height: 32,
                    width: 32,
                    child: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Image.asset(imagePath!),
                    )),
            if (title != null) myText(title)
          ],
        ),
      ),
    );

Widget carouselWidget(Size size, double height, List<String> imageUrl,
    double aspectRatio, ValueChanged indexChange) {
  return CarouselSlider(
    items: List.generate(
      imageList.length,
      (index) {
        return SizedBox(
          width: size.width,
          height: size.width * height,
          child: CachedNetworkImage(
            imageUrl: imageUrl[index],
            fit: BoxFit.cover,
            imageBuilder: (context, imageProvider) => Container(
              margin: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(15),
                  image:
                      DecorationImage(image: imageProvider, fit: BoxFit.cover)),
            ),
            placeholder: (context, size) => Center(child: circleLoader()),
            errorWidget: (context, url, error) =>
                const Center(child: Icon(Icons.error)),
          ),
        );
      },
    ),
    options: CarouselOptions(
      aspectRatio: aspectRatio,
      viewportFraction: 1,
      initialPage: 0,
      enableInfiniteScroll: true,
      reverse: false,
      autoPlay: true,
      onPageChanged: (index, reason) {
        indexChange(index);
      },
      autoPlayInterval: const Duration(seconds: 5),
      autoPlayAnimationDuration: const Duration(milliseconds: 800),
      autoPlayCurve: Curves.fastOutSlowIn,
      scrollDirection: Axis.horizontal,
    ),
  );
}

Widget profileWidgets(String title, TextEditingController textController,
        {bool enable = true}) =>
    Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        myText(title),
        BasicContainer(
          child: TextField(
            controller: textController,
            decoration: const InputDecoration(
              border: InputBorder.none,
            ),
            enabled: enable,
          ),
        ),
      ],
    );
