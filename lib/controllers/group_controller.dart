import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:groupkash/models/user.dart';
import 'package:http/http.dart' as http;
import 'package:groupkash/models/group_model.dart';
import 'package:groupkash/utils/constants.dart';
import 'package:groupkash/utils/custom_http_exception.dart';

class Group extends ChangeNotifier {
  final String _token;
  List<GroupData> _groups = [];

  Group(this._token, this._groups);

  List<GroupData> get groups {
    return _groups;
  }

  Future<GroupData> createGroup(
    String groupName,
    String groupCountry,
    String currency,
    String description,
  ) async {
    final url = Uri.parse("$baseUrl/users/groups");
    try {
      final response = await http.post(url,
          body: json.encode({
            "group_name": groupName,
            "country": groupCountry,
            "currency": currency,
            "description": description,
            "members": []
          }),
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer $_token"
          });
      final resData = json.decode(response.body);
      if (resData['success'] == false) {
        throw CustomHttpException(resData['message']);
      }
      GroupData groupData = GroupData(
          id: resData['data']["_id"],
          name: resData['data']["group_name"],
          isOwner: resData['data']["is_owner"],
          members: resData['data']["members"]);
      notifyListeners();
      return groupData;
    } catch (error) {
      rethrow;
    }
  }

  Future<void> getUserGroups() async {
    final url = Uri.parse("$baseUrl/users/groups");
    try {
      final response = await http.get(url, headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $_token"
      });
      final resData = json.decode(response.body);
      if (resData['success'] == false) {
        throw CustomHttpException(resData['message']);
      }

      resData['data'].forEach((data) {
        final loadedGroup = GroupData(
          id: data['_id'],
          name: data['group_name'],
          isOwner: data['is_owner'],
          members: data['members'],
        );
        _groups.add(loadedGroup);
      });
    } catch (error) {
      rethrow;
    }
  }
}
