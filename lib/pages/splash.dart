import 'dart:async';

import 'package:flutter/material.dart';
import 'package:groupkash/controllers/auth_controller.dart';
import 'package:groupkash/pages/home.dart';

import 'package:groupkash/pages/pages.dart';

import 'package:groupkash/utils/constants.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool offline = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final isAuth = Provider.of<Auth>(context, listen: true).isAuth;
    return Scaffold(
      backgroundColor: scaffoldBackgroundColor,
      body: isAuth ? const HomeScreen() : const WelcomeScreen(),
    );
  }
}
