import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../config/api_data.dart';
import '../model/user_details.dart';
import '../provider/user_provider.dart';
import '../utils/basic_toast.dart';

class ClientAPIService {
  Future<bool> logOut(context) async {
    final shared = await SharedPreferences.getInstance();
    shared.clear();
    UserData userData = UserData();
    Provider.of<UserProvider>(context, listen: false).setUser(userData);
    return true;
  }

  Future<dynamic> createCustomer(String email, String name, String password,
      String lastname, String userHandle, String phone, context) async {
    bool ret = false;

    var url =
        Uri.parse('${Config.urlV3}${Config.coustomerurl}${Config.keySceret}');

    var body = {
      'email': email,
      'first_name': name,
      'last_name': lastname,
      'password': password,
      'username': userHandle,
      'wooc_user_phone': phone
    };

    var response = await http.post(url, body: body);

    if (response.statusCode == 201) {
      await loginCustomer(phone, context).then((value) {
        if (value) {
          ret = true;
        }
      });
    } else {
      showToast("${jsonDecode(response.body)["message"]}");

      ret = false;
    }

    return ret;
  }

  Future<dynamic> loginCustomer(String phone, context) async {
    var success = false;
    var request = http.Request(
        'GET',
        Uri.parse(
            'http://validchoice.in/wp-json/custom/v1/customer${Config.keySceret}&phone_number=$phone'));

    http.StreamedResponse response = await request.send();
    final data = await response.stream.bytesToString();
    final jsondata = jsonDecode(data);
    if (response.statusCode == 200) {
      await retriveCoustomer(jsondata[0]["data"]["user_email"], context)
          .then((value) async {
        if (value) {
          await SharedPreferences.getInstance().then((value) {
            value.setString("phoneNumber", phone);
          });
          success = true;
        } else {
          success = false;
        }
      });
      return success;
    } else if (response.statusCode == 404) {
      showToast("=====$phone");
      return phone;
    } else {
      showToast(response.reasonPhrase ?? "");
      return false;
    }
  }

  Future<bool> retriveCoustomer(String email, context) async {
    var respo = false;
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request(
        'GET',
        Uri.parse(
            'https://validchoice.in/wp-json/wc/v3/customers?consumer_key=${Config.key}&consumer_secret=${Config.sceret}'));
    request.body = json.encode({"email": email});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var data = await response.stream.bytesToString();

      var user = jsonDecode(data);

      if (user == []) {
        respo = false;
      } else {
        UserData userData = UserData.fromJson(user[0]);
        Provider.of<UserProvider>(context, listen: false).setUser(userData);
        respo = true;
      }
    } else {
      respo = false;
      showToast(response.reasonPhrase ?? "");
    }

    return respo;
  }

  Future<bool> updateUserData(json, userid, context) async {
    var ret = false;
    var headers = {'Content-Type': 'application/json'};
    var finalUrl =
        "${Config.urlV3 + Config.coustomerurl}/$userid${Config.keySceret}";
    var request = http.Request('PUT', Uri.parse(finalUrl));
    request.body = jsonEncode(json);
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      ret = true;
      var data = await response.stream.bytesToString();

      var user = jsonDecode(data);

      UserData userData = UserData.fromJson(user);
      Provider.of<UserProvider>(context, listen: false).setUser(userData);
    } else {
      ret = false;
      showToast(response.reasonPhrase ?? "");
    }
    return ret;
  }

  Future<bool> updateProfilePicture(String userid, File image) async {
    final finalUrl =
        "${Config.urlV3 + Config.coustomerurl}/$userid${Config.keySceret}";
    final url = Uri.parse(finalUrl);
    final request = http.MultipartRequest('PUT', url);
    final imageUpload = http.MultipartFile(
        'avatar_url', image.openRead(), await image.length());
    request.files.add(imageUpload);
    final response = await request.send();

    if (response.statusCode == 200) {
      print('Profile picture updated successfully!');
      showToast('Profile picture updated successfully!');
      return true;
    } else {
      showToast("${response.statusCode}");
      print('Error updating profile picture: ${response.statusCode}');
      return false;
    }
  }

  Future<dynamic> placeOrder(orderjson) async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request(
        'POST',
        Uri.parse(
            'https://validchoice.in/wp-json/wc/v3/orders?consumer_key=${Config.key}&consumer_secret=${Config.sceret}'));
    request.body = jsonEncode(orderjson);
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 201) {
      var data = await response.stream.bytesToString();
      var jsondata = jsonDecode(data);
      print(jsondata);
      var headers = {
        'Content-Type': 'application/json',
      };
      var requestNotes = http.Request(
          'POST',
          Uri.parse(
              'https://validchoice.in/wp-json/wc/v3/orders/${jsondata["id"]}/notes${Config.keySceret}'));
      requestNotes.body = json.encode({"note": "Order Done"});
      requestNotes.headers.addAll(headers);

      http.StreamedResponse responseNotes = await requestNotes.send();

      if (responseNotes.statusCode == 200) {}
      showToast("order placed successfully");

      return true;
    } else {
      showToast(response.reasonPhrase ?? "");
      return false;
    }
  }
}
