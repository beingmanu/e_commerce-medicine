import 'package:flutter/material.dart';
import 'package:medicine_appp/main.dart';
import 'package:medicine_appp/utils/basic_container.dart';
import 'package:medicine_appp/utils/basic_scaffold.dart';
import 'package:medicine_appp/utils/basic_widgets.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({super.key});

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  @override
  Widget build(BuildContext context) {
    return BasicScaffold(
      title: "Your Orders",
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ...List.generate(
              5,
              (index) => BasicContainer(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  myText("Intagesic-MR Tablet", style: theme.text14),
                  myText("Intagesic-MR Tablet", style: theme.text14),
                  myText("Intagesic-MR Tablet", style: theme.text14),
                  myText("Order Value : ₹782",
                      style: theme.text14, align: TextAlign.end),
                  showHDivider(),
                  myText("Deliver to : ManMohan, Rest Address")
                ],
              )),
            ),
            basicSpace(height: 100)
          ],
        ),
      ),
    );
  }
}
