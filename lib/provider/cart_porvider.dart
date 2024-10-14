import 'package:flutter/material.dart';
import 'package:medicine_appp/model/address_details.dart';
import 'package:medicine_appp/model/cart_request_model.dart';
import 'package:medicine_appp/model/coupon_details.dart';
import 'package:medicine_appp/model/user_details.dart';

class CartPorvider with ChangeNotifier {
  Shipping? addressDetails;
  CartRequestModel? cartRequestModel;
  CouponDetails? appliedCoupon;
  double totalPriceMRP = 0;
  double totalDiscount = 0;
  double offerDiscount = 0;
  double youPayAmount = 0;
  double shippingcharges = 10;
  void setcart(CartRequestModel cartProducts) {
    cartProducts = cartProducts;
    setPriceValues();
    notifyListeners();
  }

  void setPriceValues() {
    if (appliedCoupon != null) {
      offerDiscount = double.parse(appliedCoupon!.offer);
    }
    for (var element in cartRequestModel!.productList!) {
      totalPriceMRP =
          totalPriceMRP + double.parse(element.productDetails!.regularPrice!);

      totalDiscount = totalDiscount +
          (double.parse(element.productDetails!.regularPrice!) -
              double.parse(element.productDetails!.price!));
    }
    youPayAmount =
        totalPriceMRP - totalDiscount - offerDiscount + shippingcharges;
  }

  void clearCart() {
    cartRequestModel = null;
    appliedCoupon = null;
    totalPriceMRP = 0;
    totalDiscount = 0;
    offerDiscount = 0;
    youPayAmount = 0;
    shippingcharges = 10;
    notifyListeners();
  }

  void addProduct(CartProducts cartProducts) {
    cartRequestModel!.productList!.add(cartProducts);
    setPriceValues();
    notifyListeners();
  }

  void removeProduct(int itemID) {
    cartRequestModel!.productList!
        .removeWhere((element) => element.productDetails!.id == itemID);
    setPriceValues();
    notifyListeners();
  }

  void incrementProductQuantity(int itemId) {
    CartProducts cartitem = cartRequestModel!.productList!
        .firstWhere((element) => element.productDetails!.id == itemId);
    if (cartitem.quantity! < 5) {
      cartitem.quantity = cartitem.quantity! + 1;
    }
    setPriceValues();
    notifyListeners();
  }

  void dicrementProductQuantity(int itemId) {
    CartProducts cartitem = cartRequestModel!.productList!
        .firstWhere((element) => element.productDetails!.id == itemId);
    if (cartitem.quantity! > 1) {
      cartitem.quantity = cartitem.quantity! - 1;
    }
    if (cartitem.quantity == 1) {
      removeProduct(itemId);
    }
    setPriceValues();
    notifyListeners();
  }
}
