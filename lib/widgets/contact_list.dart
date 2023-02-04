import 'dart:ui';

import 'package:flutter/material.dart';

class ContactList extends StatelessWidget {
  const ContactList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: ListView.builder(
          itemCount: 112,
          itemBuilder: ((_, index) {
            return Container(
              margin: const EdgeInsets.only(top: 20),
              child: Row(
                children: const [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.black,
                    child: Text('G'),
                  ),
                  Spacer(),
                  Text('George Ontekachi'),
                  Spacer(
                    flex: 3,
                  ),
                ],
              ),
            );
          })),
    );
  }
}
