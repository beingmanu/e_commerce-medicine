import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:medicine_appp/utils/basic_main_button.dart';
import 'package:medicine_appp/utils/basic_navigator.dart';

import '../../main.dart';
import '../../utils/basic_container.dart';
import '../../utils/basic_scaffold.dart';
import '../../utils/basic_widgets.dart';

class AddressesPage extends StatefulWidget {
  const AddressesPage({super.key});

  @override
  State<AddressesPage> createState() => _AddressesPageState();
}

class _AddressesPageState extends State<AddressesPage> {
  @override
  Widget build(BuildContext context) {
    return BasicScaffold(
      title: "Your Addresses",
      floatButton: FloatingActionButton.extended(
        onPressed: () => navigateTo(context, const AddAddressPage()),
        label: myText("Add Address"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ...List.generate(
              5,
              (index) => BasicContainer(
                  child: Row(
                children: [
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        myText("Manmohan Pyare"),
                        myText("Address Line 01", style: theme.text14),
                        myText("Udaipur,313001", style: theme.text14),
                      ],
                    ),
                  ),
                  basicIcon(FontAwesomeIcons.pencil)
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

class AddAddressPage extends StatefulWidget {
  const AddAddressPage({super.key});

  @override
  State<AddAddressPage> createState() => _AddAddressPageState();
}

class _AddAddressPageState extends State<AddAddressPage> {
  TextEditingController nameC = TextEditingController();

  TextEditingController addressline1 = TextEditingController();
  TextEditingController addressline2 = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController postalCode = TextEditingController();

  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return BasicScaffold(
      title: "Add Address",
      bottomWidgets: [
        BasicMainButton(onTap: () {}, isLoading: isLoading, title: "Save")
      ],
      body: Column(
        children: [
          basicSpace(height: 10),
          profileWidgets("Name", nameC),
          basicSpace(height: 10),
          profileWidgets("Address line 1", addressline1),
          basicSpace(height: 10),
          profileWidgets("Address line 2", addressline2),
          basicSpace(height: 10),
          profileWidgets("City", city),
          basicSpace(height: 10),
          profileWidgets("Postal Code", postalCode)
        ],
      ),
    );
  }
}
