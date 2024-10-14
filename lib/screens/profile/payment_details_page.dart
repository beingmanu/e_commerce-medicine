import 'package:flutter/material.dart';
import 'package:medicine_appp/utils/basic_widgets.dart';

import '../../utils/basic_scaffold.dart';

class PaymentDetailsPage extends StatefulWidget {
  const PaymentDetailsPage({super.key});

  @override
  State<PaymentDetailsPage> createState() => _PaymentDetailsPageState();
}

class _PaymentDetailsPageState extends State<PaymentDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return BasicScaffold(
      title: "Payments",
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ...List.generate(
              5,
              (index) => Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  myText("Refund"),
                  Row(
                    children: [
                      myText("₹782"),
                      const Spacer(),
                      myText("17 July,2002"),
                    ],
                  ),
                  myText("Order Id: 123456765321354831-c", maxLine: 1),
                  showHDivider()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
