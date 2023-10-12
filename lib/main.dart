import 'package:flutter/material.dart';
import 'package:paynless/screens/action_buttons/add_cash.dart';
import 'package:paynless/screens/action_buttons/analytics.dart';
import 'package:paynless/screens/action_buttons/history.dart';
import 'package:get/get.dart';
import 'package:paynless/screens/homepage.dart';
import 'package:paynless/screens/manage_cards.dart';
import 'package:paynless/screens/profile.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Paynless',
      theme: ThemeData.dark(), 
      initialRoute: "/main",
      routes: <String, WidgetBuilder>{
        '/main': (_) => const HomePage(),
        '/settings': (_) => const ManageCards(),
        '/history': (_) => const History(),
        '/profile': (_) => const Profile(),
        '/addcash': (_) => const AddCash(),
        '/analytics': (_) => const Analytics(),
      },
    );
  }
}
