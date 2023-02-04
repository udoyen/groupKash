import 'package:flutter/material.dart';
import 'package:groupkash/utils/constants.dart';

class HomeWelcome extends StatelessWidget {
  const HomeWelcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 179,
      decoration: const BoxDecoration(
        color: mainColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(420),
          bottomRight: Radius.circular(420),
        ),
      ),
      child: const Center(
        child: Text(
          'Welcome, lets get started!',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
