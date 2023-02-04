import 'dart:convert';

class UserData {
  String username;
  String firstName;
  String lastName;
  String phoneNumber;
  bool kyc;
  Map<String, dynamic> groups;

  UserData(
      {required this.username,
      required this.firstName,
      required this.lastName,
      required this.phoneNumber,
      required this.kyc,
      required this.groups});
}
