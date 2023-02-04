import 'package:firebase_phone_auth_handler/firebase_phone_auth_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:groupkash/controllers/auth_controller.dart';
import 'package:groupkash/pages/auth_area/dashboard_main.dart';
import 'package:groupkash/pages/home.dart';
import 'package:groupkash/pages/pages.dart';
import 'package:groupkash/utils/constants.dart';
import 'package:groupkash/utils/custom_http_exception.dart';
import 'package:provider/provider.dart';

class CreatePinScreen extends StatefulWidget {
  const CreatePinScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<CreatePinScreen> createState() => _CreatePinScreenState();
}

class _CreatePinScreenState extends State<CreatePinScreen>
    with WidgetsBindingObserver {
  bool isLoading = false;
  bool isKeyboardVisible = false;
  final _formKey = GlobalKey<FormState>();

  // controllers for the text fields
  String pinOne = "";
  String pinTwo = "";
  String pinThree = "";
  String pinFour = "";
  String pinFive = "";
  String pinSix = "";

  void _createPin() async {
    setState(() {
      isLoading = true;
    });
    if (!_formKey.currentState!.validate()) {
      return;
    }
    _formKey.currentState!.save();
    String pin = "$pinOne$pinTwo$pinThree$pinFour$pinFive$pinSix";
    if (pin.length < 4) {
      return;
    }
    try {
      await Provider.of<Auth>(context, listen: false).createPin(pin);
      setState(() {
        isLoading = false;
      });
      _navigate();
    } on CustomHttpException catch (error) {
      setState(() {
        isLoading = false;
      });
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(error.toString())));
    } catch (error) {
      setState(() {
        isLoading = false;
      });
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Internal Server Error")));
    }
  }

  void _navigate() {
    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: ((context) => const HomeScreen()),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 25,
              ),
              const Text(
                "Create Security Pin",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 300,
                width: double.infinity,
                alignment: const Alignment(0.6, 0.9),
                child: Image.asset("images/securitypin.png"),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(13.0),
                child: Text(
                  "Please kindly set-up a four digit pin to help secure your account",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 14,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Form(
                key: _formKey,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 40,
                      height: 40,
                      child: TextFormField(
                        style: const TextStyle(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                        cursorColor: Colors.black,
                        keyboardType: TextInputType.number,
                        obscureText: true,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        validator: (val) {
                          if (val!.length != 1) {
                            return;
                          }
                        },
                        onSaved: ((val) {
                          setState(() {
                            pinOne = val!;
                          });
                        }),
                        onChanged: (val) {
                          if (val.length == 1) {
                            FocusScope.of(context).nextFocus();
                          }
                        },
                        decoration: const InputDecoration(
                          focusColor: Colors.black,
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(
                              width: 2,
                              color: Colors.black,
                            ),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              width: 2,
                              color: Colors.black,
                            ),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              width: 2,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 25,
                    ),
                    SizedBox(
                      width: 40,
                      height: 40,
                      child: TextFormField(
                        style: const TextStyle(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                        cursorColor: Colors.black,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        validator: (val) {
                          if (val!.length != 1) {
                            return;
                          }
                        },
                        onSaved: ((val) {
                          setState(() {
                            pinTwo = val!;
                          });
                        }),
                        onChanged: (val) {
                          if (val.length == 1) {
                            FocusScope.of(context).nextFocus();
                          }
                        },
                        decoration: const InputDecoration(
                          focusColor: Colors.black,
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(
                              width: 2,
                              color: Colors.black,
                            ),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              width: 2,
                              color: Colors.black,
                            ),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              width: 2,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 25,
                    ),
                    SizedBox(
                      width: 40,
                      height: 40,
                      child: TextFormField(
                        style: const TextStyle(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                        cursorColor: Colors.black,
                        keyboardType: TextInputType.number,
                        obscureText: true,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        validator: (val) {
                          if (val!.length != 1) {
                            return;
                          }
                        },
                        onSaved: ((val) {
                          setState(() {
                            pinThree = val!;
                          });
                        }),
                        onChanged: (val) {
                          if (val.length == 1) {
                            FocusScope.of(context).nextFocus();
                          }
                        },
                        decoration: const InputDecoration(
                          focusColor: Colors.black,
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(
                              width: 2,
                              color: Colors.black,
                            ),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              width: 2,
                              color: Colors.black,
                            ),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              width: 2,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 25,
                    ),
                    SizedBox(
                      width: 40,
                      height: 40,
                      child: TextFormField(
                        style: const TextStyle(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                        cursorColor: Colors.black,
                        keyboardType: TextInputType.number,
                        obscureText: true,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        validator: (val) {
                          if (val!.length != 1) {
                            return;
                          }
                        },
                        onSaved: ((val) {
                          setState(() {
                            pinFour = val!;
                          });
                        }),
                        onChanged: (val) {
                          if (val.length == 1) {
                            FocusScope.of(context).nextFocus();
                          }
                        },
                        decoration: const InputDecoration(
                          focusColor: Colors.black,
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(
                              width: 2,
                              color: Colors.black,
                            ),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              width: 2,
                              color: Colors.black,
                            ),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              width: 2,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 25,
                    ),
                    SizedBox(
                      width: 40,
                      height: 40,
                      child: TextFormField(
                        style: const TextStyle(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                        cursorColor: Colors.black,
                        keyboardType: TextInputType.number,
                        obscureText: true,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        validator: (val) {
                          if (val!.length != 1) {
                            return;
                          }
                        },
                        onSaved: ((val) {
                          setState(() {
                            pinFive = val!;
                          });
                        }),
                        onChanged: (val) {
                          if (val.length == 1) {
                            FocusScope.of(context).nextFocus();
                          }
                        },
                        decoration: const InputDecoration(
                          focusColor: Colors.black,
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(
                              width: 2,
                              color: Colors.black,
                            ),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              width: 2,
                              color: Colors.black,
                            ),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              width: 2,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 25,
                    ),
                    SizedBox(
                      width: 40,
                      height: 40,
                      child: TextFormField(
                        style: const TextStyle(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                        cursorColor: Colors.black,
                        keyboardType: TextInputType.number,
                        obscureText: true,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        validator: (val) {
                          if (val!.length != 1) {
                            return;
                          }
                        },
                        onSaved: ((val) {
                          setState(() {
                            pinSix = val!;
                          });
                        }),
                        onChanged: (val) {
                          if (val.length == 1) {
                            return;
                          }
                        },
                        decoration: const InputDecoration(
                          focusColor: Colors.black,
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(
                              width: 2,
                              color: Colors.black,
                            ),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              width: 2,
                              color: Colors.black,
                            ),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              width: 2,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 100,
              ),
              Container(
                width: 287,
                height: 60,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(40),
                  child: OutlinedButton(
                    onPressed: _createPin,
                    style: OutlinedButton.styleFrom(
                      backgroundColor: mainColor,
                    ),
                    child: isLoading
                        ? const CircularProgressIndicator(
                            color: Colors.white,
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                "Create",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                ),
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
