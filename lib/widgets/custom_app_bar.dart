import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  // creating a custom app bar that receives a title and a width as required
  // parameters and an action which is a widget
  final String title;
  final double width;
  final Widget? action;

  const CustomAppBar(
      {Key? key, required this.title, required this.width, this.action})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(
              Icons.arrow_back,
              size: 19,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          SizedBox(width: width),
          Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          action == null
              ? Container()
              : Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: action,
                  ),
                ),
        ],
      ),
    );
  }
}
