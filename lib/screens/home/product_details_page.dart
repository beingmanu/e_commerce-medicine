import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:medicine_appp/model/product_details.dart';
import 'package:medicine_appp/screens/home/home_screen.dart';
import 'package:medicine_appp/utils/basic_container.dart';
import 'package:medicine_appp/utils/basic_main_button.dart';
import 'package:medicine_appp/utils/basic_scaffold.dart';

import '../../main.dart';
import '../../utils/basic_widgets.dart';
import '../../widgets/indicator_widget.dart';
import '../../widgets/product_widget.dart';

class ProductDetailsPage extends StatefulWidget {
  const ProductDetailsPage({super.key});

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  int pagecount = 0;
  bool isLoading = false;
  bool showReview = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BasicScaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            carouselWidget(
              size,
              size.width * .8,
              imageList,
              5 / 3,
              (value) => setState(() => pagecount = value),
            ),
            Center(
                child: IndicatorWidget(
              currentCarouselPage: pagecount,
              totalLength: 3,
            )),
            myText("Intagesic-MR Tablet", style: theme.text14bold),
            Row(
              children: [
                myText("MRP : ", style: theme.text14),
                myText("₹782",
                    style: theme.text14gray!
                        .copyWith(decoration: TextDecoration.lineThrough)),
              ],
            ),
            myText("₹782", style: theme.text14bold),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                BasicMainButton(
                    onTap: () {}, isLoading: isLoading, title: "Add to Cart"),
                basicIcon(FontAwesomeIcons.share, size: 30),
                basicIcon(FontAwesomeIcons.heart, size: 30)
              ],
            ),
            basicSpace(height: 20),
            SizedBox(
              height: 50,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        basicIcon(FontAwesomeIcons.star),
                        myText("4.8 Rating")
                      ],
                    ),
                    myText("•"),
                    Row(
                      children: [
                        basicIcon(FontAwesomeIcons.pencil),
                        myText("2.4K+ Reviews")
                      ],
                    )
                  ],
                ),
              ),
            ),
            BasicContainer(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ...List.generate(
                        2,
                        (index) => SizedBox(
                          child: Center(
                            child: GestureDetector(
                              onTap: () => setState(() => index == 0
                                  ? showReview = false
                                  : showReview = true),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  myText(index == 0 ? "Description" : "Review",
                                      style: theme.text16bold!.copyWith(
                                          color: index == 0
                                              ? showReview
                                                  ? theme.tCDefault
                                                  : theme.gLightColor
                                              : showReview
                                                  ? theme.gLightColor
                                                  : theme.tCDefault)),
                                  Container(
                                    height: 2,
                                    width: 80,
                                    color: index == 0
                                        ? showReview
                                            ? Colors.transparent
                                            : theme.gLightColor
                                        : showReview
                                            ? theme.gLightColor
                                            : Colors.transparent,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  basicSpace(height: 20),
                  showReview ? const ReviewWidget() : const DescriptionWidget(),
                ],
              ),
            ),
            basicSpace(height: 10),
            BasicContainer(
                child: Column(
              children: [
                myText("Similer Products"),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ...List.generate(
                        6,
                        (index) => ProductWidget(
                          product: ProductDetails(),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            )),
            basicSpace(height: 100)
          ],
        ),
      ),
    );
  }
}

class DescriptionWidget extends StatefulWidget {
  const DescriptionWidget({super.key});

  @override
  State<DescriptionWidget> createState() => _DescriptionWidgetState();
}

class _DescriptionWidgetState extends State<DescriptionWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        myText("Product introduction"),
        myText(
            "Intagesic-MR Tablet is a combination medicine used in the treatment of pain due to muscle spasms. It improves the movement of muscles and provides relief from pain and discomfort associated with muscle spasms.",
            style: theme.text14),
        basicSpace(height: 10),
        myText("Uses & Benefits"),
        myText(
            "Treatment of Pain due to muscle spasm\nIntagesic-MR Tablet is a combination medicine that is used to relieve pain, inflammation, and swelling in conditions that affect muscles. Also, it effectively relieves muscle stiffness or spasm, thereby improving muscle movement. It works by blocking chemical messengers in the brain that tell us we have pain.",
            style: theme.text14),
        basicSpace(height: 10),
        myText("SALT COMPOSITION"),
        myText(
            "Chlorzoxazone (250mg) + Diclofenac (50mg) + Paracetamol (325mg)",
            style: theme.text14),
        basicSpace(height: 10),
        myText("Storage"),
        myText("Store below 30°C", style: theme.text14),
        basicSpace(height: 10),
        myText("Marketer"),
        myText("Intas Pharmaceuticals Ltd", style: theme.text14),
        basicSpace(height: 10),
        myText("Side effects"),
        myText("""Nausea
Vomiting
Heartburn
Stomach pain
Diarrhea
Loss of appetite
Dryness in mouth
Indigestion
Skin rash""", style: theme.text14),
      ],
    );
  }
}

class ReviewWidget extends StatefulWidget {
  const ReviewWidget({super.key});

  @override
  State<ReviewWidget> createState() => _ReviewWidgetState();
}

class _ReviewWidgetState extends State<ReviewWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...List.generate(
          5,
          (index) => Row(
            children: [
              const CircleAvatar(),
              basicSpace(width: 10),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    myText("Man Mohan Pyare", style: theme.text16bold),
                    Row(
                      children: [
                        ...List.generate(
                          5,
                          (index) => basicIcon(FontAwesomeIcons.star),
                        )
                      ],
                    ),
                    myText("Good Srevice", style: theme.text14),
                    basicSpace(height: 10)
                  ],
                ),
              ),
            ],
          ),
        ),
        myText("View More")
      ],
    );
  }
}
