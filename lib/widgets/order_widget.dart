import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:medicine_appp/main.dart';
import 'package:medicine_appp/model/cart_request_model.dart';
import 'package:medicine_appp/utils/basic_widgets.dart';

class CartProductWidget extends StatelessWidget {
  final CartProducts cartProducts;
  const CartProductWidget({
    super.key,
    required this.cartProducts,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(5.0),
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
          border: Border.all(color: theme.gLightColor),
          borderRadius: BorderRadius.circular(15),
          color: theme.colorBG),
      child: Row(
        children: [
          Container(
            height: size.width * .15,
            width: size.width * .2,
            margin: const EdgeInsets.symmetric(vertical: 3),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(
                cartProducts.productDetails!.images == []
                    ? "https://images.unsplash.com/photo-1487147264018-f937fba0c817?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
                    : cartProducts.productDetails!.images![0].src!,
                fit: BoxFit.cover,
              ),
            ),
          ),
          basicSpace(width: 5),
          Flexible(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              myText("${cartProducts.productDetails!.name}"),
              myText("Intas Pharmaceuticals Ltd", style: theme.text14gray),
              basicSpace(height: 5),
              Row(
                children: [
                  Expanded(
                      child: Row(
                    children: [
                      myText("₹${cartProducts.productDetails!.price}"),
                      myText("  ₹", style: theme.text14gray),
                      myText("${cartProducts.productDetails!.regularPrice}",
                          style: theme.text14gray!
                              .copyWith(decoration: TextDecoration.lineThrough))
                    ],
                  )),
                  iconButton(icon: FontAwesomeIcons.minus, size: 12),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: theme.gLightColor),
                        borderRadius: BorderRadius.circular(15)),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: myText("Q : ${cartProducts.quantity}",
                        style: theme.text14),
                  ),
                  iconButton(icon: FontAwesomeIcons.plus, size: 12)
                ],
              )
            ],
          ))

          // SizedBox(
          //     child: Column(
          //   children: [
          //     ...List.generate(
          //       2,
          //       (index) =>  )
          //   ],
          // ))
        ],
      ),
    );
  }
}
