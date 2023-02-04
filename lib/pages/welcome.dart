import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:groupkash/pages/enter_phone_screen.dart';
import 'package:groupkash/utils/constants.dart';
import 'package:groupkash/widgets/appbtn.dart';

// Screen with three images and a welcome message.
class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 50, bottom: 80),
              child: Text(
                'Connect, Contribute and spend efficiently',
                style: TextStyle(color: Colors.black, fontSize: 15),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage(firstIntroImage), fit: BoxFit.cover),
                  ),
                ),
                Container(
                  width: 100,
                  height: 100,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage(secondIntroImage), fit: BoxFit.cover),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),
            Container(
              width: 100,
              height: 100,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: AssetImage(secondIntroImage), fit: BoxFit.cover),
              ),
            ),
            const SizedBox(height: 20),
            Image.asset(
              blackFullNameLogo,
              width: 200,
              height: 100,
            ),
            const SizedBox(height: 60),
            AppButton(
              callback: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => const EnterPhone(),
                  ),
                );
              },
              title: 'Get started',
            ),
          ],
        ),
      ),
    ));
  }
}
