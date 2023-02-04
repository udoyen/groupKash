import 'package:flutter/material.dart';
import 'package:groupkash/controllers/auth_controller.dart';
import 'package:groupkash/pages/pages.dart';
import 'package:groupkash/utils/constants.dart';
import 'package:groupkash/utils/custom_http_exception.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatefulWidget {
  final String phoneNumber;

  const SignUpScreen({Key? key, required this.phoneNumber}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool isLoading = false;
  final _formKey = GlobalKey<FormState>();
  String firstName = "";
  String lastName = "";
  String userName = "";
  String email = "";
  String password = "";

  RegExp _emailVal = RegExp(r'^[a-z0-9]+[._]?[a-z0-9]+[@]\w+[.]\w{2,3}$');

  // final _firstNameNode = FocusNode();
  final _lastNameNode = FocusNode();
  final _userNameNode = FocusNode();
  final _emailNode = FocusNode();
  final _passwordNode = FocusNode();

  void _navigate(String phone) {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (cts) => LoginScreen(phone: phone)));
  }

  void _register() async {
    try {
      setState(() {
        isLoading = true;
      });
      if (!_formKey.currentState!.validate()) {
        return;
      }
      _formKey.currentState!.save();
      final res = await Provider.of<Auth>(context, listen: false).registerUser(
          firstName, lastName, password, userName, email, widget.phoneNumber);
      setState(() {
        isLoading = false;
      });
      _navigate(res);
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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Form(
          key: _formKey,
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Container(
                  alignment: Alignment.center,
                  child: const Padding(
                    padding: EdgeInsets.only(top: 38.0),
                    child: Text(
                      'Sign up',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  child: Image.asset(
                    'images/namecolor.png',
                    width: 20,
                    height: 20,
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 15, right: 15, top: 10, bottom: 15),
                  child: TextFormField(
                    cursorColor: Colors.black,
                    textInputAction: TextInputAction.next,
                    onSaved: ((val) {
                      setState(() {
                        firstName = val!;
                      });
                    }),
                    onFieldSubmitted: (_) {
                      FocusScope.of(context).requestFocus(_lastNameNode);
                    },
                    validator: ((value) {
                      if (value!.length <= 2) {
                        return "please provide your firstname";
                      }
                      return null;
                    }),
                    decoration: const InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(30),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 0, color: Colors.grey),
                        borderRadius: BorderRadius.all(
                          Radius.circular(30),
                        ),
                      ),
                      labelText: 'First name',
                      labelStyle: TextStyle(color: Colors.grey),
                      hintText: 'John',
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: TextFormField(
                    focusNode: _lastNameNode,
                    cursorColor: Colors.black,
                    textInputAction: TextInputAction.next,
                    onSaved: ((val) {
                      setState(() {
                        lastName = val!;
                      });
                    }),
                    onFieldSubmitted: (_) {
                      FocusScope.of(context).requestFocus(_userNameNode);
                    },
                    validator: ((value) {
                      if (value!.length <= 2) {
                        return "please provide your lastname";
                      }
                      return null;
                    }),
                    decoration: const InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(30),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 0, color: Colors.black),
                        borderRadius: BorderRadius.all(
                          Radius.circular(30),
                        ),
                      ),
                      labelText: 'Last name',
                      labelStyle: TextStyle(color: Colors.grey),
                      hintText: 'Doe',
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: TextFormField(
                    focusNode: _userNameNode,
                    cursorColor: Colors.black,
                    textInputAction: TextInputAction.next,
                    onSaved: ((val) {
                      setState(() {
                        userName = val!;
                      });
                    }),
                    onFieldSubmitted: (_) {
                      FocusScope.of(context).requestFocus(_emailNode);
                    },
                    validator: ((value) {
                      if (value!.length <= 2) {
                        return "please provide your  username";
                      }
                      return null;
                    }),
                    decoration: const InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(30),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 0, color: Colors.black),
                        borderRadius: BorderRadius.all(
                          Radius.circular(30),
                        ),
                      ),
                      labelText: 'Username',
                      labelStyle: TextStyle(color: Colors.grey),
                      hintText: 'John214',
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: TextFormField(
                    focusNode: _emailNode,
                    cursorColor: Colors.black,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    onSaved: ((val) {
                      setState(() {
                        email = val!;
                      });
                    }),
                    onFieldSubmitted: (_) {
                      FocusScope.of(context).requestFocus(_passwordNode);
                    },
                    validator: ((value) {
                      if (value!.length <= 2) {
                        return "please provide a valid email";
                      }

                      if (!_emailVal.hasMatch(value)) {
                        return "please provide a valid email";
                      }
                      return null;
                    }),
                    decoration: const InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      border: OutlineInputBorder(
                        borderSide: BorderSide(width: 0, color: Colors.grey),
                        borderRadius: BorderRadius.all(
                          Radius.circular(30),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 0, color: Colors.black),
                        borderRadius: BorderRadius.all(
                          Radius.circular(30),
                        ),
                      ),
                      labelText: 'Email',
                      labelStyle: TextStyle(color: Colors.grey),
                      hintText: 'John@gmail.com',
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: TextFormField(
                    focusNode: _passwordNode,
                    cursorColor: Colors.black,
                    keyboardType: TextInputType.emailAddress,
                    onSaved: ((val) {
                      setState(() {
                        password = val!;
                      });
                    }),
                    obscureText: true,
                    validator: (value) {
                      if (value!.length < 6) {
                        return "please create a strong password";
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      border: OutlineInputBorder(
                        borderSide: BorderSide(width: 0, color: Colors.grey),
                        borderRadius: BorderRadius.all(
                          Radius.circular(30),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 0, color: Colors.black),
                        borderRadius: BorderRadius.all(
                          Radius.circular(30),
                        ),
                      ),
                      labelText: 'Password',
                      labelStyle: TextStyle(color: Colors.grey),
                      hintText: '**********',
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(40),
                    child: Container(
                      height: 50,
                      child: OutlinedButton(
                        onPressed: () => _register(),
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
                                    "Register",
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
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
