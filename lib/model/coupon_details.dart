class CouponDetails {
  String couponId;
  String offer;
  String description;
  List<String> termsandCondition;
  List<String> productList;
  String imageUrl;
  CouponDetails({
    required this.couponId,
    required this.offer,
    required this.description,
    required this.termsandCondition,
    required this.productList,
    required this.imageUrl,
  });
}
