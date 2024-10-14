import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:medicine_appp/model/product_details.dart';

import '../config/api_data.dart';
import '../main.dart';
import '../utils/basic_toast.dart';

class ApiService {
  Future<dynamic> getCategories() async {
    var url =
        "https://validchoice.in/wp-json/wc/v3/products/categories${Config.keySceret}";
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      return null;
    }
  }

  Future<ProductDetails?> getAProduct(String productID) async {
    var request = http.Request(
        'GET',
        Uri.parse(
            '${Config.urlV3 + Config.producturl}/$productID${Config.keySceret}'));

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final data = await response.stream.bytesToString();
      final jsondata = jsonDecode(data);
      ProductDetails product = ProductDetails.fromJson(jsondata);
      return product;
    } else {
      print(response.reasonPhrase);
      return null;
    }
  }

  String getFinalUrlForProducts({
    String perPage = "16",
    String orderby = "",
    String order = "",
    String search = "",
    int page = 1,
    String miniPrice = "0",
    String maxPrice = "",
    String isexistUrl = "",
  }) {
    String perPageN = "&per_page=$perPage";
    String orderBy = orderby == "" ? "" : "&orderby=$orderby";
    String orderad = order == "" ? "" : "&order=$order";
    String searchString = search == "" ? "" : "&search=$search";
    String pageN = "&page=${page.toString()}";
    String miniPricevalue = miniPrice == "0" ? "" : "&min_price=$miniPrice";
    String maxPricevalue = maxPrice == "" ? "" : "&max_price=$maxPrice";
    String prePage = "&page=${(page - 1).toString()}";

    String finalURL = isexistUrl != ""
        ? isexistUrl.replaceAll(prePage, pageN)
        : Config.urlV3 +
            Config.producturl +
            Config.keySceret +
            perPageN +
            orderBy +
            orderad +
            searchString +
            pageN +
            miniPricevalue +
            maxPricevalue;

    return finalURL;
  }

  Future<List<ProductDetails>> getProductList(
      List<ProductDetails> productList, String finalURL) async {
    var response = await http.get(Uri.parse(finalURL));
    if (response.statusCode == 200) {
      var jsonlist = jsonDecode(response.body);
      for (var element in jsonlist) {
        productList.add(ProductDetails.fromJson(element));
      }
      return productList;
    } else {
      showToast("Something went wrong...");
      return productList;
    }
  }

  Future<List<String>> getBannerImages(String search) async {
    final List<String> imageDataList = [];
    String finalURL = "${Config.urlV2}${Config.mediaurl}?search=$search";
    try {
      var request = http.Request('GET', Uri.parse(finalURL));

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        final responsedata = await response.stream.bytesToString();
        final data = jsonDecode(responsedata);

        for (var element in data) {
          imageDataList.add(element["source_url"]);
        }
        return imageDataList;
      } else {
        print("===============\n${response.reasonPhrase}");

        return imageDataList;
      }
    } catch (e) {
      return imageDataList;
    }
  }
}
