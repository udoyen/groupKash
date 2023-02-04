import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:groupkash/pages/auth_area/dashboard_main.dart';
import 'package:groupkash/widgets/appbtn.dart';
import 'package:groupkash/widgets/top_text.dart';

import '../../widgets/custom_app_bar.dart';

class GenerateAcctNumber extends StatelessWidget {
  const GenerateAcctNumber({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // controls the radius of the image avatars
    const radius = 30.0;
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(
              child: CustomAppBar(
                title: "Create New Group",
                width: 60,
              ),
            ),
            const SliverToBoxAdapter(
              child: Center(
                child: Text('Group has been created successfully, Let\'s go.'),
              ),
            ),
            const SliverToBoxAdapter(
              child: Image(
                image: AssetImage('images/group.png'),
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 20.0, top: 50, bottom: 10),
                    child: Text('Invite link'),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Container(
                      width: 450,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Text('hgjtufggfhfds'),
                          IconButton(
                            onPressed: () {
                              Get.snackbar(
                                'Invite Link',
                                'Copied',
                              );
                            },
                            icon: const Icon(Icons.copy_rounded),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 20.0, bottom: 10),
                    child: Text('Account number'),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Container(
                      width: 450,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(),
                      ),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const Text('89856747685'),
                            IconButton(
                                onPressed: () {
                                  Get.snackbar('Account Number', 'Copied');
                                },
                                icon: const Icon(Icons.copy_rounded))
                          ]),
                    ),
                  ),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: Row(
                children: [
                  Container(
                    height: 70,
                    padding: const EdgeInsets.only(left: 40, top: 10),
                    width: MediaQuery.of(context).size.width,
                    child: Stack(
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 15),
                          child: const CircleAvatar(
                            radius: radius,
                            backgroundImage: AssetImage('images/intro1.jpg'),
                          ),
                        ),
                        const Positioned(
                          left: 70,
                          child: CircleAvatar(
                            radius: radius,
                            backgroundImage: AssetImage('images/intro3.jpg'),
                          ),
                        ),
                        const Positioned(
                          left: 120,
                          child: CircleAvatar(
                            radius: radius,
                            backgroundImage: AssetImage('images/intro1.jpg'),
                          ),
                        ),
                        const Positioned(
                          left: 170,
                          child: CircleAvatar(
                            radius: radius,
                            backgroundImage: AssetImage('images/intro3.jpg'),
                          ),
                        ),
                        Positioned(
                          left: 220,
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(),
                              shape: BoxShape.circle,
                            ),
                            child: const CircleAvatar(
                              radius: radius - 1,
                              backgroundColor: Colors.white,
                              child: Text(
                                '+13',
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                width: double.infinity,
                alignment: const Alignment(-0.1, 0),
                child: const Text(
                  'Micheal, Joshua, Ukandu & 16 Others',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 28.0, horizontal: 20),
                child: AppButton(
                    callback: () {
                      Get.to(() => MainDashboardPage());
                    },
                    title: 'Dashboard'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
