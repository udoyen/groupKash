import 'package:flutter/material.dart';
import 'package:groupkash/utils/constants.dart';
import 'package:groupkash/widgets/custom_app_bar.dart';

class UpdateAccountName extends StatelessWidget {
  const UpdateAccountName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const CustomAppBar(
                title: "Update Account Name",
                width: 40,
              ),
              Text(
                "This should be your full kegal name as it appears on your documents",
                style: TextStyle(
                  color: Colors.grey[500],
                  fontSize: 12,
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
                        "First Name",
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
                      height: 30,
                    ),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.only(left: 30, bottom: 10),
                      child: Text(
                        "Last Name",
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
                      height: 30,
                    ),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.only(left: 30, bottom: 10),
                      child: Text(
                        "Other Names",
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
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
