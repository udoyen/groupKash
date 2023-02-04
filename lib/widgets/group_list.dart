import 'package:flutter/material.dart';
import 'package:groupkash/controllers/group_controller.dart';
import 'package:groupkash/pages/auth_area/dashboard_main.dart';
import 'package:provider/provider.dart';

class GroupList extends StatefulWidget {
  const GroupList({Key? key}) : super(key: key);

  @override
  State<GroupList> createState() => _GroupListState();
}

class _GroupListState extends State<GroupList> {
  @override
  Widget build(BuildContext context) {
    final groups = Provider.of<Group>(context, listen: true).groups;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: ListView.builder(
          itemCount: groups.length,
          itemBuilder: ((_, index) {
            return GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(MainDashboardPage.routeName,
                    arguments: groups[index]);
              },
              child: Container(
                margin: const EdgeInsets.only(top: 20),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.black,
                      child: Text(groups[index].name[0]),
                    ),
                    const Spacer(),
                    Text(groups[index].name),
                    const Spacer(
                      flex: 3,
                    ),
                    // Container(
                    //   padding: const EdgeInsets.symmetric(
                    //       vertical: 5, horizontal: 10),
                    //   decoration: BoxDecoration(
                    //     border: Border.all(color: Colors.grey),
                    //     borderRadius: BorderRadius.circular(10),
                    //   ),
                    //   child: const Text(
                    //     '3000',
                    //     style: TextStyle(color: Colors.greenAccent),
                    //   ),
                    // ),
                  ],
                ),
              ),
            );
          })),
    );
  }
}
