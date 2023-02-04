import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:groupkash/pages/home.dart';
import 'package:groupkash/pages/pages.dart';
import 'package:groupkash/utils/constants.dart';

class EnterPhoneOtpScreen extends StatefulWidget {
  final String phoneNumber;
  const EnterPhoneOtpScreen({Key? key, required this.phoneNumber})
      : super(key: key);

  @override
  _EnterPhoneOtpScreenState createState() => _EnterPhoneOtpScreenState();
}

class _EnterPhoneOtpScreenState extends State<EnterPhoneOtpScreen> {
  bool isLoading = false;
  bool isKeyboardVisible = false;
  final _formKey = GlobalKey<FormState>();
  FirebaseAuth auth = FirebaseAuth.instance;
  String verifyId = "";

  // controllers for the text fields
  String pinOne = "";
  String pinTwo = "";
  String pinThree = "";
  String pinFour = "";
  String pinFive = "";
  String pinSix = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _registerWithPhone();
  }

  void _navigate() {
    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: ((context) => SignUpScreen(
            phoneNumber: widget.phoneNumber,
          )),
    ));
  }

  void _registerWithPhone() async {
    await auth.verifyPhoneNumber(
        phoneNumber: widget.phoneNumber,
        verificationCompleted: ((phoneAuthCredential) async {}),
        verificationFailed: ((error) {
          print(error.message);
        }),
        codeSent: (verificationId, forceResendingToken) {
          verifyId = verificationId;
          setState(() {});
        },
        codeAutoRetrievalTimeout: ((verificationId) {}));
  }

  void _verifyOtpCode() async {
    try {
      if (!_formKey.currentState!.validate()) {
        return;
      }
      _formKey.currentState!.save();
      String code = "$pinOne$pinTwo$pinThree$pinFour$pinFive$pinSix";
      print(verifyId);
      PhoneAuthCredential credential =
          PhoneAuthProvider.credential(verificationId: verifyId, smsCode: code);
      await auth.signInWithCredential(credential);
      _navigate();
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Invalid OTP Code,a New Code has been sent"),
        ),
      );
    }
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
                "Verify Phone Number",
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
                  "Please kindly enter the six digit code sent to ${widget.phoneNumber}",
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
                    onPressed: _verifyOtpCode,
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
                                "Verify",
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    width: 20,
                  ),
                  const Text("Didn't receive the code?"),
                  TextButton(
                    onPressed: () {
                      _registerWithPhone();
                    },
                    child: const Text(
                      "Resend",
                      style: TextStyle(
                        color: mainColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
