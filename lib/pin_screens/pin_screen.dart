import 'package:flutter/material.dart';
import 'package:groupkash/controllers/auth_controller.dart';
import 'package:groupkash/pin_screens/create_pin_screen.dart';
import 'package:groupkash/pin_screens/enter_pin_screen.dart';
import 'package:provider/provider.dart';

class PinScreen extends StatelessWidget {
  const PinScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isPinSet = Provider.of<Auth>(context).isPinSet;
    return Scaffold(
      body: isPinSet ? const EnterPinScreen() : const CreatePinScreen(),
    );
  }
}
