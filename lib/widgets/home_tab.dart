import 'package:flutter/material.dart';
import 'package:groupkash/pages/userprofile/user_profile.dart';
import 'package:groupkash/utils/constants.dart';
import 'package:groupkash/widgets/contact_list.dart';
import 'package:groupkash/widgets/group_list.dart';
import 'package:groupkash/widgets/home_welcome.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> with TickerProviderStateMixin {
  void _navigateProfile() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (ctx) => UserProfile()));
  }

  @override
  Widget build(BuildContext context) {
    var tabTexts = ['Groups', 'Contacts'];
    final mediaQuery = MediaQuery.of(context).size;

    final TabController _controller = TabController(length: 2, vsync: this);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: mainColor,
        elevation: 0,
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 20),
            child: GestureDetector(
              onTap: _navigateProfile,
              child: const CircleAvatar(
                backgroundImage: AssetImage(
                  'images/intro2.jpg',
                ),
              ),
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Container(
          child: Column(children: [
            const HomeWelcome(),
            Container(
              height: 40,
              child: TabBar(
                labelColor: Colors.black,
                labelStyle: const TextStyle(fontSize: 16),
                controller: _controller,
                indicatorSize: TabBarIndicatorSize.label,
                tabs: tabTexts
                    .map(
                      (e) => Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 0, horizontal: 5),
                        child: Tab(
                          text: e,
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
            Container(
              width: double.maxFinite,
              height: mediaQuery.height * 0.59,
              child: TabBarView(
                controller: _controller,
                children: const [
                  GroupList(),
                  ContactList(),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
