import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:medicine_appp/model/product_details.dart';
import 'package:medicine_appp/screens/home/product_details_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';
import '../utils/basic_navigator.dart';
import '../utils/basic_widgets.dart';

class ProductWidget extends StatefulWidget {
  final ProductDetails product;
  const ProductWidget({super.key, required this.product});

  @override
  State<ProductWidget> createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(3),
      width: size.width * .5 - 8,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          GestureDetector(
            onTap: () => navigateTo(context, const ProductDetailsPage()),
            child: SizedBox(
              height: size.width * .3,
              width: size.width * .5 - 8,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                  widget.product.images!.isEmpty
                      ? "https://images.unsplash.com/photo-1487147264018-f937fba0c817?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
                      : widget.product.images![0].src!,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          myText(widget.product.name ?? "", style: theme.text14, maxLine: 2),
          myText("₹${widget.product.price}", style: theme.text14gray),
          GestureDetector(
            onTap: () async {
              SharedPreferences sharedPreferences =
                  await SharedPreferences.getInstance();
            },
            child: iconButton(
                icon: FontAwesomeIcons.cartArrowDown,
                size: 18,
                title: "Add to cart"),
          )
        ],
      ),
    );
  }
}
