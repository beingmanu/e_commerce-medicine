import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:medicine_appp/main.dart';
import 'package:medicine_appp/model/coupon_details.dart';
import 'package:medicine_appp/model/user_details.dart';
import 'package:medicine_appp/provider/cart_porvider.dart';
import 'package:medicine_appp/service/api_service.dart';
import 'package:medicine_appp/utils/basic_container.dart';
import 'package:medicine_appp/utils/basic_main_button.dart';
import 'package:medicine_appp/utils/basic_scaffold.dart';
import 'package:medicine_appp/utils/basic_toast.dart';
import 'package:medicine_appp/utils/basic_widgets.dart';
import 'package:medicine_appp/widgets/order_widget.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../model/cart_request_model.dart';

class MyCartcreen extends StatefulWidget {
  const MyCartcreen({super.key});

  @override
  State<MyCartcreen> createState() => _MyCartcreenState();
}

class _MyCartcreenState extends State<MyCartcreen> {
  ApiService apiService = ApiService();
  Shipping? addressDetails;
  CouponDetails? couponDetails;
  CartRequestModel? cartRequestModel;

  bool isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  getCartProducts() async {
    setState(() => isLoading = true);
    SharedPreferences shared = await SharedPreferences.getInstance();
    final data = shared.getString("CartProducts");
    if (data == null) {
      showToast("Cart is Empty");
      setState(() => isLoading = false);

      return;
    }
    final jsondata = jsonDecode(data);
    CartRequestModel cart = CartRequestModel.fromJson(jsondata);
    if (cart.productList == null || cart.productList!.isEmpty) {
      showToast("Cart is Empty");
      setState(() => isLoading = false);

      return;
    }
    for (var element in cart.productList!) {
      await apiService.getAProduct(element.productid.toString()).then(
        (value) {
          if (value != null) {
            int index = cart.productList!.indexWhere(
              (ele) => ele.productid == element.productid,
            );
            cart.productList![index].productDetails = value;
          }
        },
      );
    }
    Provider.of<CartPorvider>(context).setcart(cart);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    cartRequestModel = Provider.of<CartPorvider>(context).cartRequestModel;
    couponDetails = Provider.of<CartPorvider>(context).appliedCoupon;
    addressDetails = Provider.of<CartPorvider>(context).addressDetails;
    cartRequestModel = Provider.of<CartPorvider>(context).cartRequestModel;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BasicScaffold(
      showBack: false,
      title: "My Cart",
      body: cartRequestModel == null || !isLoading
          ? Center(
              child: circleLoader(),
            )
          : SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  BasicContainer(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisSize: MainAxisSize.min,
                      children: addressDetails == null
                          ? [myText("Please select Address!")]
                          : [
                              myText("${addressDetails}"),
                              myText("188, Acche ddnewa,ashojnm ,253325",
                                  style: theme.text14gray)
                            ],
                    ),
                  ),
                  couponDetails == null
                      ? const SizedBox()
                      : BasicContainer(
                          bgColor: const Color.fromARGB(222, 199, 255, 201),
                          child: Center(
                            child: myText("28% Discount!",
                                style: theme.text16!
                                    .copyWith(color: Colors.green)),
                          ),
                        ),
                  basicSpace(height: 25),
                  myText("Items in Cart", align: TextAlign.start),
                  if (cartRequestModel!.productList!.isNotEmpty)
                    ...List.generate(
                      cartRequestModel!.productList!.length,
                      (index) => CartProductWidget(
                        cartProducts: cartRequestModel!.productList![index],
                      ),
                    ),
                  basicSpace(height: 25),
                  myText("Offers & Benefits", align: TextAlign.start),
                  BasicContainer(
                    child: Row(
                      children: [
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              myText("'KINGSAVE' coupon applied"),
                              myText("₹78 coupon savings",
                                  style: theme.text14gray),
                            ],
                          ),
                        ),
                        myText("Remove",
                            style: theme.text14!.copyWith(color: Colors.red))
                      ],
                    ),
                  ),
                  BasicContainer(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        myText("Join our membership"),
                        myText("more ₹30 savings", style: theme.text14gray),
                      ],
                    ),
                  ),
                  basicSpace(height: 25),
                  myText("Add more stuffs", align: TextAlign.start),
                  BasicContainer(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          ...List.generate(
                            10,
                            (index) => Container(
                              padding: const EdgeInsets.all(5),
                              width: size.width * .3,
                              child: Column(
                                children: [
                                  Container(
                                    height: size.width * .2,
                                    width: size.width * .3,
                                    margin:
                                        const EdgeInsets.symmetric(vertical: 3),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: Image.network(
                                        "https://images.unsplash.com/photo-1487147264018-f937fba0c817?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  myText("Intagesic-MR Tablet",
                                      style: theme.text14),
                                  myText("₹782", style: theme.text14gray),
                                  BasicMainButton(
                                    onTap: () {},
                                    isLoading: isLoading,
                                    title: "Add",
                                    hPadding: 0,
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  basicSpace(height: 25),
                  myText("Bill Details", align: TextAlign.start),
                  BasicContainer(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [myText("Item Total"), myText("₹782")],
                        ),
                        showHDivider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [myText("Item Discount"), myText("- ₹102")],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            myText("Coupon Discount"),
                            myText("- ₹85")
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            myText("Membership Discount"),
                            myText("- ₹35")
                          ],
                        ),
                        showHDivider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            myText("Shipping Charges"),
                            myText("₹102")
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [myText("Plateform Fee"), myText("₹102")],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            myText("GST & other Charges"),
                            myText("₹102")
                          ],
                        ),
                        showHDivider(),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [myText("To Pay"), myText("₹1503")],
                          ),
                        ),
                      ],
                    ),
                  ),
                  basicSpace(height: 25),
                  BasicContainer(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        myText(
                            "Orders can be canceled within 24 hours of placement. A cancellation fee of [amount] may apply for cancellations after the processing window. Refunds will be processed within [number] business days. Shipping charges are non-refundable. For urgent cancellations, please contact our customer support team immediately.",
                            style: theme.text14gray),
                        myText("Read Cancellation Policy")
                      ],
                    ),
                  ),
                  basicSpace(height: 30),
                  BasicMainButton(
                      onTap: () {}, isLoading: isLoading, title: "Order Now"),
                  basicSpace(height: 40)
                ],
              ),
            ),
    );
  }
}
