import 'package:flutter/material.dart';

class Toptext extends StatelessWidget {
  final String text;
  const Toptext({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 28),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
        ),
      ),
    );
  }
}
