import 'package:flutter/material.dart';
import 'package:medicine_appp/utils/basic_scaffold.dart';
import 'package:medicine_appp/widgets/category_widget.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return BasicScaffold(
      title: "Categories",
      body: SingleChildScrollView(
        child: Column(
          children: [
            Wrap(
              children: [
                ...List.generate(
                  15,
                  (index) => CategoryWidget(),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
