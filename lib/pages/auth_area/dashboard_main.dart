import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:groupkash/models/group_model.dart';
import 'package:groupkash/pages/grouptransactions/group_expenditure.dart';
import 'package:groupkash/pages/grouptransactions/group_income.dart';
import 'package:groupkash/pages/auth_area/members_screen.dart';
import 'package:groupkash/utils/constants.dart';
import 'package:groupkash/widgets/custom_app_bar.dart';
import 'package:groupkash/widgets/drawer_card.dart';
import 'package:groupkash/widgets/top_text.dart';
import 'package:intl/intl.dart';

enum MemberRole {
  groupAdmin,
  groupMember,
}

class MainDashboardPage extends StatefulWidget {
  MainDashboardPage({Key? key}) : super(key: key);
  static String routeName = "/group-dashboard";
  @override
  State<MainDashboardPage> createState() => _MainDashboardPageState();
}

class _MainDashboardPageState extends State<MainDashboardPage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  bool isAdmin = true;

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    currency(context) {
      Localizations.localeOf(context);

      var format =
          NumberFormat.simpleCurrency(locale: Platform.localeName, name: 'NGN');
      return format;
    }

    final group = ModalRoute.of(context)!.settings.arguments as GroupData;

    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,
        endDrawer: Drawer(
          width: 220,
          child: Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(20)),
            ),
            child: Column(
              children: isAdmin
                  ? [
                      const SizedBox(height: 20),
                      DrawerCard(
                        onPressed: () {
                          Get.to(() => const MembersScreen());
                        },
                        text: "Members(20)",
                        icon: const Icon(
                          Icons.people,
                          color: Colors.black,
                        ),
                      ),
                      DrawerCard(
                        onPressed: () {},
                        text: "Group Details",
                        icon: const Icon(
                          Icons.info_outline,
                          color: Colors.black,
                        ),
                      ),
                      DrawerCard(
                        onPressed: () {},
                        text: "Member Request(12)",
                        icon: const Icon(
                          Icons.people_alt_outlined,
                          color: Colors.black,
                        ),
                      ),
                      DrawerCard(
                        onPressed: () {},
                        text: "Payment Category",
                        icon: const Icon(
                          Icons.payment_outlined,
                          color: Colors.black,
                        ),
                      ),
                      DrawerCard(
                        onPressed: () {},
                        text: "Transfer Funds",
                        icon: const Icon(
                          Icons.send_to_mobile_outlined,
                          color: Colors.black,
                        ),
                      ),
                      DrawerCard(
                        onPressed: () {},
                        text: "Leave Group",
                        icon: const Icon(
                          Icons.exit_to_app_outlined,
                          color: Colors.black,
                        ),
                      )
                    ]
                  : [
                      const SizedBox(height: 20),
                      DrawerCard(
                        onPressed: () {
                          Get.to(() => const MembersScreen());
                        },
                        text: "Members(20)",
                        icon: const Icon(
                          Icons.people,
                          color: Colors.black,
                        ),
                      ),
                      DrawerCard(
                        onPressed: () {},
                        text: "Group Details",
                        icon: const Icon(
                          Icons.info_outline,
                          color: Colors.black,
                        ),
                      ),
                      DrawerCard(
                        onPressed: () {},
                        text: "My Payment History",
                        icon: const Icon(
                          Icons.payments_outlined,
                          color: Colors.black,
                        ),
                      ),
                      DrawerCard(
                        onPressed: () {},
                        text: "Leave Group",
                        icon: const Icon(
                          Icons.exit_to_app_outlined,
                          color: Colors.black,
                        ),
                      )
                    ],
            ),
          ),
        ),
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: CustomAppBar(
                title: group.name,
                width: 70,
                action: IconButton(
                  onPressed: () {
                    scaffoldKey.currentState?.openEndDrawer();
                  },
                  icon: const Icon(Icons.more_vert),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
                child: Container(
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: mainColor,
                  ),
                  child: const Center(
                    child: Text(
                      'Available balance = 100,000.00',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (ctx) => const GroupIncome()));
                      },
                      child: Container(
                        width: 157,
                        height: 115,
                        decoration: BoxDecoration(
                          color: mainColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Income',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: FittedBox(
                                child: Text(
                                  '${currency(context).currencyName!} 3000.00',
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 26,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (ctx) => const GroupExpenditure()));
                      },
                      child: Container(
                        width: 157,
                        height: 115,
                        decoration: BoxDecoration(
                          color: mainColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Expenditure',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: FittedBox(
                                child: Text(
                                  '${currency(context).currencyName!} 5,000.00',
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 26,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            isAdmin
                ? SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15.0, horizontal: 20),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                'Share group link',
                                style: TextStyle(
                                    color: mainColor,
                                    fontWeight: FontWeight.w600),
                              ),
                              FittedBox(
                                child: Text(
                                    'Invite friends to join the group by sharing group private link.'),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                : SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15.0, horizontal: 20),
                      child: Container(
                        decoration: const BoxDecoration(
                            color: mainColor,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  ImageIcon(
                                    AssetImage(
                                      'images/exchange.png',
                                    ),
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    'Make group Payment',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                              const FittedBox(
                                child: Text(
                                  'Send money to this group with just one click !',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Recent Transaction',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    SizedBox(
                      width: 400,
                      height: 400,
                      child: ListView.builder(
                        itemBuilder: ((_, index) {
                          return Padding(
                            padding: const EdgeInsets.only(top: 18.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(bottom: 8.0),
                                  child: Text(
                                    '4 Apr 2022',
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 15, horizontal: 10),
                                  decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Colors.grey.shade100),
                                  ),
                                  child: Row(
                                    children: [
                                      const CircleAvatar(
                                        radius: 20,
                                        backgroundImage:
                                            AssetImage('images/intro2.jpg'),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: const [
                                          Text(
                                            'Micheal Stephens',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w800),
                                          ),
                                          Text(
                                            '2:45 am',
                                            style:
                                                TextStyle(color: Colors.grey),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        width: 70,
                                      ),
                                      Text(
                                        '${currency(context).currencyName!} 300',
                                        style:
                                            TextStyle(color: Colors.green[700]),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
