import 'package:flutter/material.dart';

import '../model/user_details.dart';

class UserProvider with ChangeNotifier {
  late UserData userInformation;
  void setUser(UserData userdata) {
    userInformation = userdata;
    notifyListeners();
  }
}
