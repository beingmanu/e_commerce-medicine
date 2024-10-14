import 'package:flutter/material.dart';
import 'package:medicine_appp/model/address_details.dart';
import 'package:medicine_appp/model/product_details.dart';
import 'package:medicine_appp/model/user_details.dart';

class AppDateProvider with ChangeNotifier {
  List<String> homePosters = [];
  List<String> offersPosters = [];
  List<String> categories = [];
  List<ProductDetails> featureProducts = [];
  List<ProductDetails> likedProducts = [];
  List<ProductDetails> productList = [];
  List<Shipping> addressLost = [];
}
