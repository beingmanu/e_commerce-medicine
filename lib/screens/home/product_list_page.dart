import 'package:flutter/material.dart';
import 'package:medicine_appp/service/api_service.dart';
import 'package:medicine_appp/utils/basic_scaffold.dart';
import 'package:medicine_appp/utils/basic_widgets.dart';
import 'package:medicine_appp/widgets/product_widget.dart';

import '../../model/product_details.dart';

class ProductListPage extends StatefulWidget {
  final String? title;

  const ProductListPage({super.key, this.title});

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  late Future<List<ProductDetails>> _getproductList;
  ApiService apiService = ApiService();
  @override
  void initState() {
    super.initState();
    _getproductList =
        apiService.getProductList([], apiService.getFinalUrlForProducts());
  }

  @override
  Widget build(BuildContext context) {
    return BasicScaffold(
        title: widget.title,
        body: FutureBuilder(
            future: _getproductList,
            builder: (context, snap) {
              if (snap.connectionState == ConnectionState.waiting) {
                return Center(
                  child: circleLoader(),
                );
              }
              if (snap.data!.isEmpty) {
                return myText("No Data");
              }
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Wrap(
                      children: [
                        ...List.generate(
                          snap.data!.length,
                          (index) => ProductWidget(
                            product: snap.data![index],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              );
            }));
  }
}
