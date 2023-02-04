import 'package:flutter/material.dart';
import 'package:groupkash/widgets/custom_app_bar.dart';

import '../../utils/constants.dart';

class UpdateUserEmail extends StatelessWidget {
  const UpdateUserEmail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const CustomAppBar(title: "Update Email Address", width: 40),
              Text(
                "Please make sure you add a valid email address",
                style: TextStyle(
                  color: Colors.grey[500],
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Form(
                  child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.only(left: 30, bottom: 10),
                    child: Text(
                      "Email Address",
                      style: TextStyle(
                        color: Colors.grey[700],
                      ),
                    ),
                  ),
                  Container(
                    width: 360,
                    height: 50,
                    child: TextFormField(
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey[400]!,
                          ),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey[400]!,
                          ),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        labelStyle: TextStyle(
                          color: Colors.grey[500],
                          fontSize: 12,
                        ),
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey[400]!,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                  Container(
                    width: 287,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(140),
                      color: mainColor,
                    ),
                    child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        "SAVE",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  )
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
