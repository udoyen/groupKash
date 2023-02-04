import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:groupkash/pages/enter_phone_otp_screen.dart';
import 'package:groupkash/pages/pages.dart';
import 'package:http/http.dart' as http;
import 'package:groupkash/utils/constants.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class EnterPhone extends StatefulWidget {
  const EnterPhone({Key? key}) : super(key: key);

  @override
  State<EnterPhone> createState() => _EnterPhoneState();
}

class _EnterPhoneState extends State<EnterPhone> {
  String phoneNumber = "";
  bool isLoading = false;

  final _formKey = GlobalKey<FormState>();
  RegExp _phoneVal = RegExp(r'^(?:[+0]234)?[0-9]{11}$');

  void _navigate(Widget page) {
    Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => page));
  }

  Future<void> _continueWithPhone() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    setState(() {
      isLoading = true;
    });
    _formKey.currentState!.save();
    final url = Uri.parse("$baseUrl/checkPhonenumber/$phoneNumber");
    try {
      final response = await http.get(url);
      setState(() {
        isLoading = false;
      });

      final resData = json.decode(response.body);

      if (resData['success'] == true) {
        _navigate(LoginScreen(phone: phoneNumber));
      } else {
        _navigate(EnterPhoneOtpScreen(phoneNumber: phoneNumber));
      }
    } catch (error) {
      setState(() {
        isLoading = false;
      });
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 15,
              ),
              const Text("Please enter mobile number to continue"),
              const SizedBox(
                height: 20,
              ),
              Container(
                child: Image.asset("images/logo.png"),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                alignment: const Alignment(-0.7, 0),
                width: double.infinity,
                child: const Text(
                  "Enter Mobile Number",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Form(
                key: _formKey,
                child: SizedBox(
                  height: 90,
                  width: 327,
                  child: IntlPhoneField(
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.phone,
                    initialCountryCode: 'NG',
                    onSaved: ((newValue) {
                      setState(() {
                        phoneNumber =
                            "${newValue!.countryCode}${newValue.number}";
                      });
                    }),
                    validator: (value) {
                      if (value!.toString().isEmpty) {
                        return 'Please enter a valid phone number';
                      }
                      // if (!_phoneVal.hasMatch(value)) {
                      //   return 'Please enter a valid phone number';
                      // }
                      return null;
                    },
                    onSubmitted: (_) {
                      _continueWithPhone();
                    },
                    textAlignVertical: TextAlignVertical.center,
                    decoration: InputDecoration(
                      hintText: '90*********',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 120,
              ),
              Container(
                width: 287,
                height: 60,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(40),
                  child: OutlinedButton(
                    onPressed: _continueWithPhone,
                    style: OutlinedButton.styleFrom(
                      backgroundColor: mainColor,
                    ),
                    child: isLoading
                        ? const CircularProgressIndicator(
                            color: Colors.white,
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: const [
                              Text(
                                "Continue",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                width: 70,
                              ),
                              Icon(
                                Icons.arrow_forward,
                                color: Colors.white,
                              ),
                            ],
                          ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
