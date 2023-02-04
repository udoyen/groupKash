import 'package:flutter/material.dart';
import 'package:groupkash/utils/constants.dart';
import 'package:groupkash/widgets/custom_app_bar.dart';

class MembersScreen extends StatelessWidget {
  const MembersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustomAppBar(
              title: "Members",
              width: 95,
              action: IconButton(
                onPressed: () async {
                  await _menuOver(context);
                },
                icon: const Icon(Icons.more_vert),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> _menuOver(BuildContext context) async {
    return showMenu(
      position: const RelativeRect.fromLTRB(200, 75, 20, 100),
      context: context,
      items: [
        const PopupMenuItem(
          child: Text("Select All"),
        ),
        const PopupMenuItem(
          child: Text("Remove"),
        ),
        const PopupMenuItem(
          child: Text("Make Admin"),
        ),
      ],
    );
  }
}
