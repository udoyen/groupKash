import 'package:flutter/material.dart';

class DrawerCard extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget icon;
  final String text;
  const DrawerCard(
      {Key? key,
      required this.onPressed,
      required this.text,
      required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: GestureDetector(
        onTap: onPressed,
        child: ListTile(
          leading: icon,
          title: Text(
            text,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
