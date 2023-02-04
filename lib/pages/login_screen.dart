import 'package:flutter/material.dart';
import 'package:groupkash/controllers/auth_controller.dart';
import 'package:groupkash/pin_screens/pin_screen.dart';
import 'package:groupkash/utils/constants.dart';
import 'package:groupkash/utils/custom_http_exception.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  final String phone;
  const LoginScreen({Key? key, required this.phone}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  String password = "";

  void _navigate() {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (cts) => const PinScreen()));
  }

  void _loginUser(String phone) async {
    try {
      if (!_formKey.currentState!.validate()) {
        return;
      }
      _formKey.currentState!.save();

      setState(() {
        isLoading = true;
      });
      await Provider.of<Auth>(context, listen: false)
          .loginUser(phone, password);
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
      print(error);
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Internal Server Error")));
    }
  }

  @override
  Widget build(BuildContext context) {
    final phone = widget.phone;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 15,
              ),
              const Text("Please enter your password to continue"),
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
                  "Enter Password",
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
                  height: 60,
                  width: 327,
                  child: TextFormField(
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.text,
                    obscureText: true,
                    onSaved: ((newValue) {
                      setState(() {
                        password = newValue!;
                      });
                    }),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your password';
                      }
                      // if (!_phoneVal.hasMatch(value)) {
                      //   return 'Please enter a valid phone number';
                      // }
                      return null;
                    },
                    onFieldSubmitted: (_) {
                      _loginUser(phone);
                    },
                    textAlignVertical: TextAlignVertical.center,
                    decoration: InputDecoration(
                      hintText: 'password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
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
                    onPressed: () => _loginUser(phone),
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
