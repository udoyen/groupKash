import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:groupkash/pages/creategroup/generate_acctnumber.dart';
import 'package:groupkash/widgets/appbtn.dart';
import 'package:groupkash/widgets/top_text.dart';

import '../../widgets/custom_app_bar.dart';

class CreateGroupAddContacts extends StatelessWidget {
  const CreateGroupAddContacts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              child: Text('Add members'),
            ),
          ),
          const SliverToBoxAdapter(
            child: Center(
              child: Text('Phone contact list'),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: AppButton(
                  callback: () {
                    Get.to(() => const GenerateAcctNumber());
                  },
                  title: 'Continue'),
            ),
          ),
        ],
      )),
    );
  }
}
