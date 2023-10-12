import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paynless/screens/action_buttons/add_cash.dart';
import 'package:paynless/screens/action_buttons/analytics.dart';
import 'package:paynless/screens/action_buttons/history.dart';
import 'package:paynless/screens/homepage.dart';
import 'package:paynless/screens/login_page.dart';
import 'package:paynless/screens/manage_cards.dart';
import 'package:paynless/screens/payment.dart';
import 'package:paynless/screens/profile.dart';
import 'package:paynless/utils/flutter_init_sdk.dart';

void main() {
  runZonedGuarded(() {
    FlutterInitSDK.initialize(run);
  }, (error, stack) {
    debugPrint('error: $error');
    debugPrint('stack: $stack');
  });
}

void run() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Paynless',
      theme: ThemeData.light(
        useMaterial3: true,
      ),
      initialRoute: "/login",
      routes: <String, WidgetBuilder>{
        '/': (_) => const HomePage(),
        "/login": (_) => const LoginPage(),
        '/settings': (_) => const ManageCards(),
        '/history': (_) => const History(),
        '/profile': (_) => const Profile(),
        '/addcash': (_) => const AddCash(),
        '/analytics': (_) => const Analytics(),
        '/payment': (_)=> const Payment(),
      },
    );
  }
}
