import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:groupkash/controllers/auth_controller.dart';
import 'package:groupkash/controllers/group_controller.dart';
import 'package:groupkash/firebase_options.dart';

import 'package:groupkash/pages/auth_area/dashboard_main.dart';
import 'package:groupkash/pages/home.dart';
import 'package:groupkash/pages/pages.dart';
import 'package:groupkash/utils/constants.dart';
import 'package:provider/provider.dart';

void main() async {
  // initialize firebase else firebase will throw an error.
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => Auth()),
        ChangeNotifierProxyProvider<Auth, Group>(
            update: (ctx, auth, previousGroup) => Group(auth.accessToken!,
                previousGroup == null ? [] : previousGroup.groups),
            create: ((ctx) =>
                Group(Provider.of<Auth>(ctx, listen: false).accessToken!, []))),
      ],
      child: Consumer<Auth>(
        builder: (context, auth, _) => MaterialApp(
            debugShowCheckedModeBanner: false,
            title: appName,
            theme: ThemeData(
              fontFamily: font,
              scaffoldBackgroundColor: scaffoldBackgroundColor,
            ),
            home: auth.isAuth ? const HomeScreen() : const SplashScreen(),
            routes: {
              HomeScreen.routeName: (ctx) => const HomeScreen(),
              MainDashboardPage.routeName: (ctx) => MainDashboardPage(),
            }),
      ),
    );
  }
}
