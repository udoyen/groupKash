import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:groupkash/controllers/auth_controller.dart';
import 'package:groupkash/controllers/group_controller.dart';
import 'package:groupkash/pages/creategroup/create_group_form.dart';
import 'package:groupkash/pages/kyc_form.dart';
import 'package:groupkash/pages/userprofile/user_profile.dart';
import 'package:groupkash/utils/constants.dart';
import 'package:groupkash/widgets/home_tab.dart';
import 'package:groupkash/widgets/home_welcome.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static String routeName = "/home-screen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration.zero, () async {
      await Provider.of<Auth>(context, listen: false).getUserProfile();
      _getUserGroup();
    });
  }

  void _getUserGroup() async {
    await Provider.of<Group>(context, listen: false).getUserGroups();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          elevation: 10,
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const CreateGroupForm()));
          },
          backgroundColor: mainColor,
          child: const CircleAvatar(
            radius: 15,
            backgroundColor: Colors.white,
            child: Icon(
              Icons.add,
              color: mainColor,
            ),
          ),
        ),
        backgroundColor: Colors.white,
        body: const HomeTab(),
      ),
    );
  }
}
