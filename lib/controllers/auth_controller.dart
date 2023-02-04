import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:groupkash/models/user.dart';
import 'package:groupkash/utils/constants.dart';
import 'package:http/http.dart' as http;

import '../utils/custom_http_exception.dart';

class Auth extends ChangeNotifier {
  String _accessToken = "";
  String _refreshToken = "";
  bool _isPinSet = false;

  UserData _user = UserData(
    firstName: "",
    lastName: "",
    username: "",
    kyc: false,
    groups: {},
    phoneNumber: "",
  );

  String? get accessToken {
    if (_accessToken.isEmpty) {
      return null;
    }
    return _accessToken;
  }

  String? get refreshToken {
    if (_refreshToken.isEmpty) {
      return null;
    }
    return _accessToken;
  }

  bool get isAuth {
    return accessToken != null;
  }

  bool get isPinSet {
    return _isPinSet;
  }

  UserData get user {
    return _user;
  }

  Future<String> registerUser(
      String firstName,
      String lastName,
      String password,
      String userName,
      String email,
      String phoneNumber) async {
    final url = Uri.parse("$baseUrl/register");
    try {
      var response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode({
          "username": userName,
          "first_name": firstName,
          "last_name": lastName,
          "password": password,
          "email": email,
          "phone_number": phoneNumber,
          "firebase_uid": FirebaseAuth.instance.currentUser?.uid,
        }),
      );
      // var userInfo = res.body['data'];
      final resData = json.decode(response.body);
      if (resData['success'] == false) {
        throw CustomHttpException(resData['message']);
      }
      return phoneNumber;
    } catch (error) {
      rethrow;
    }
  }

  Future<String?> loginUser(String phone, String password) async {
    try {
      final url = Uri.parse("$baseUrl/login");
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode({"phone_number": phone, "password": password}),
      );
      final responseData = await json.decode(response.body);
      if (responseData['success'] == false) {
        throw CustomHttpException(responseData['message']);
      }
      _accessToken = responseData["data"]['access_token'];
      _refreshToken = responseData['data']['refresh_token'];
      _isPinSet = responseData['data']['pin_state'];
      notifyListeners();
      return accessToken;
    } catch (error) {
      rethrow;
    }
  }

  Future<void> createPin(String pin) async {
    try {
      final url = Uri.parse("$baseUrl/pin");
      final response = await http.post(url,
          body: json.encode({"pin": pin}),
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer $_accessToken"
          });
      final resData = json.decode(response.body);
      if (resData['success'] == false) {
        throw CustomHttpException(resData['message']);
      }
    } catch (error) {
      rethrow;
    }
  }

  Future<void> verifyPin(String pin) async {
    try {
      final url = Uri.parse("$baseUrl/pin/verify");
      final response = await http.post(url,
          body: json.encode({"pin": pin}),
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer $_accessToken"
          });
      final resData = json.decode(response.body);
      if (resData['success'] == false) {
        throw CustomHttpException(resData['message']);
      }
    } catch (error) {
      rethrow;
    }
  }

  Future<void> getUserProfile() async {
    try {
      final url = Uri.parse("$baseUrl/user/profile");
      final response = await http.get(url, headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $_accessToken"
      });
      final resData = json.decode(response.body);
      if (resData['success'] == false) {
        throw CustomHttpException(resData['message']);
      }

      _user.firstName = resData['data']['first_name'];
      _user.lastName = resData['data']['last_name'];
      _user.username = resData['data']['username'];
      _user.phoneNumber = resData['data']['phone_number'];
      _user.kyc = resData['data']['kyc'];
      // _user.groups = resData['data']['groups'];
      notifyListeners();
    } catch (error) {
      rethrow;
    }
  }

  Future<void> verifyKyc(String dateOfBirth, int bvn) async {
    try {
      final url = Uri.parse("$baseUrl/kyc");
      final response = await http.post(url,
          body: json.encode({"dob": dateOfBirth, "bvn_number": bvn}),
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer $_accessToken"
          });
      final resData = json.decode(response.body);
    } catch (error) {
      rethrow;
    }
  }
}
