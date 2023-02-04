import 'package:flutter/material.dart';
import 'package:groupkash/utils/constants.dart';
import 'package:groupkash/widgets/custom_app_bar.dart';

class GroupIncome extends StatelessWidget {
  const GroupIncome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const CustomAppBar(
              title: "",
              width: 0,
            ),
            Container(
              width: 276,
              height: 136,
              decoration: const BoxDecoration(
                color: mainColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "Income",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "#200.00",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24.39,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: mediaQuery.height * 0.67,
              width: mediaQuery.width * 0.9,
              decoration: BoxDecoration(
                color: Colors.grey[200],
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 7,
                    ),
                    Container(
                      alignment: const Alignment(-0.89, 0),
                      child: const Text(
                        "Recent Expenditure",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ),
                    const Card(
                      child: ListTile(
                        leading: CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.black,
                          child: Text('R'),
                        ),
                        title: Text(
                          "Resonance Team successfull transfered to mr okeye",
                          style: TextStyle(
                              fontSize: 10, fontWeight: FontWeight.bold),
                        ),
                        trailing: Text(
                          "#200.00",
                          style: TextStyle(
                              color: Colors.green,
                              fontSize: 12,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    const Card(
                      child: ListTile(
                        leading: CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.black,
                          child: Text('R'),
                        ),
                        title: Text(
                          "Resonance Team successfull transfered to mr okeye",
                          style: TextStyle(
                              fontSize: 10, fontWeight: FontWeight.bold),
                        ),
                        trailing: Text(
                          "#200.00",
                          style: TextStyle(
                              color: Colors.green,
                              fontSize: 12,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    const Card(
                      child: ListTile(
                        leading: CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.black,
                          child: Text('R'),
                        ),
                        title: Text(
                          "Resonance Team successfull transfered to mr okeye",
                          style: TextStyle(
                              fontSize: 10, fontWeight: FontWeight.bold),
                        ),
                        trailing: Text(
                          "#200.00",
                          style: TextStyle(
                              color: Colors.green,
                              fontSize: 12,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    const Card(
                      child: ListTile(
                        leading: CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.black,
                          child: Text('R'),
                        ),
                        title: Text(
                          "Resonance Team successfull transfered to mr okeye",
                          style: TextStyle(
                              fontSize: 10, fontWeight: FontWeight.bold),
                        ),
                        trailing: Text(
                          "#200.00",
                          style: TextStyle(
                              color: Colors.green,
                              fontSize: 12,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    const Card(
                      child: ListTile(
                        leading: CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.black,
                          child: Text('R'),
                        ),
                        title: Text(
                          "Resonance Team successfull transfered to mr okeye",
                          style: TextStyle(
                              fontSize: 10, fontWeight: FontWeight.bold),
                        ),
                        trailing: Text(
                          "#200.00",
                          style: TextStyle(
                            color: Colors.green,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
