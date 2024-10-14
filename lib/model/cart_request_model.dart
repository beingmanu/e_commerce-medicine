import 'package:medicine_appp/model/product_details.dart';

class CartRequestModel {
  int? userid;
  List<CartProducts>? productList;

  CartRequestModel({this.userid, this.productList});

  CartRequestModel.fromJson(Map<String, dynamic> json) {
    userid = json['user_id'];
    if (json['products'] != null) {
      productList = <CartProducts>[];
      json['products'].forEach((v) {
        productList!.add(CartProducts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = userid;
    if (productList != null) {
      data['products'] = productList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CartProducts {
  int? productid;
  int? quantity;
  ProductDetails? productDetails;

  CartProducts({this.productid, this.quantity, this.productDetails});

  CartProducts.fromJson(Map<String, dynamic> json) {
    productid = json['product_id'];
    quantity = json['quantity'];
    productDetails = json["product_details"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['product_id'] = productid;
    data['quantity'] = quantity;
    // data["product_details"] = productDetails;
    return data;
  }
}
