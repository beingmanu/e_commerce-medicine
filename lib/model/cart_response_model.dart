class CartResponseModel {
  bool? statue;
  List<CartItem>? data;
  CartResponseModel({
    this.statue,
    this.data,
  });
  CartResponseModel.fromJson(Map<String, dynamic> json) {
    statue = json['status'];
    if (json['data'] != null) {
      data = <CartItem>[];
      json["data"].forEach((v) {
        data!.add(CartItem.fromJson(v));
      });
    }
  }
}

class CartItem {
  int? productId;
  String? productName;
  String? productregularPrise;
  String? productSalePrice;
  String? thumbnail;
  int? qty;
  double? linesubtotal;
  double? lineTotal;

  CartItem(
      {this.productId,
      this.productName,
      this.productregularPrise,
      this.productSalePrice,
      this.thumbnail,
      this.qty,
      this.linesubtotal,
      this.lineTotal});

  CartItem.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    productName = json['product_name'];
    productregularPrise = json['product_regular_prise'];
    productSalePrice = json['product_sale_price'];
    thumbnail = json['thumbnail'];
    qty = json['qty'];
    linesubtotal = double.parse(json['line_subtotal'].toString());
    lineTotal = double.parse(json['line_total'].toString());
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['product_id'] = productId;
    data['product_name'] = productName;
    data['product_regular_prise'] = productregularPrise;
    data['product_sale_price'] = productSalePrice;
    data['thumbnail'] = thumbnail;
    data['qty'] = qty;
    data['line_subtotal'] = linesubtotal;
    data['line_total'] = lineTotal;
    return data;
  }
}
