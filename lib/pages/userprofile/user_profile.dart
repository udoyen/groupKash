import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:groupkash/main.dart';
import 'package:groupkash/pages/userprofile/update_account_name.dart';
import 'package:groupkash/pages/userprofile/update_phone_number.dart';
import 'package:groupkash/pages/userprofile/update_user_email.dart';
import 'package:groupkash/utils/constants.dart';

import '../../widgets/custom_app_bar.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const CustomAppBar(
              title: "Profile",
              width: 100,
            ),
            const SizedBox(
              height: 70,
              width: 70,
              child: CircleAvatar(
                backgroundColor: Colors.black,
                backgroundImage: AssetImage('images/intro2.jpg'),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextButton(
              onPressed: () {},
              child: const Text(
                "Change Profile Image",
                style: TextStyle(color: Colors.red, fontSize: 14),
              ),
            ),
            InkWell(
              onTap: () {
                Get.to(() => const UpdateAccountName());
              },
              child: Container(
                width: double.infinity,
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      alignment: const Alignment(-0.721, 0),
                      child: const Text(
                        "Account Name",
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: const [
                        Text(
                          "Nnanna George Bontus Jnr",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 16,
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            InkWell(
              onTap: () {
                Get.to(() => const UpdateUserEmail());
              },
              child: Container(
                width: double.infinity,
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      alignment: const Alignment(-0.721, 0),
                      child: const Text(
                        "Email Address",
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: const [
                        Text(
                          "Chineduelijah@gmail.com",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 16,
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            InkWell(
              onTap: () {
                Get.to(() => const UpdateUserPhone());
              },
              child: Container(
                width: double.infinity,
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      alignment: const Alignment(-0.721, 0),
                      child: const Text(
                        "Phone Number",
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: 300,
                          alignment: const Alignment(-0.79, 0),
                          child: const Text(
                            "+2348163734006",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(right: 20.0),
                          child: Icon(
                            Icons.arrow_forward_ios,
                            size: 16,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 90,
            ),
            Container(
              height: 90,
              width: 350,
              decoration: BoxDecoration(
                border: Border.all(
                  color: mainColor,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.share,
                        color: mainColor,
                        size: 14,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "Share This App",
                        style: TextStyle(color: mainColor),
                      )
                    ],
                  ),
                  const Text("Send money to this group with just one click !")
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
