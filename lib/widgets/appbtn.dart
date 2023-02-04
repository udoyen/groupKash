import 'package:flutter/material.dart';
import 'package:groupkash/utils/constants.dart';

class AppButton extends StatelessWidget {
  final VoidCallback callback;
   String? title;
   AppButton({Key? key, required this.callback,  this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: callback,
      child: Container(
          height: 60,
          width: 300,
          decoration: BoxDecoration(
            color: mainColor,
            borderRadius: BorderRadius.circular(50),
          ),
          child: Row(
            children: [
              Expanded(
                child: Center(
                  child: Text(
                    title!,
                    style: const TextStyle(color: Colors.white, fontSize: 19),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(right: 30, top: 5),
                child: const Icon(
                  Icons.arrow_forward_rounded,
                  color: Colors.white,
                ),
              ),
            ],
          )),
    );
  }
}
