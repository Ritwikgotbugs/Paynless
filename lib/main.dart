import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paynless/screens/history.dart';
import 'package:paynless/screens/home_page.dart';
import 'package:paynless/screens/login_page.dart';
import 'package:paynless/screens/manage_cards.dart';
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
      theme: ThemeData(
        useMaterial3: true,
        textTheme: GoogleFonts.dmSansTextTheme(),
      ),
      initialRoute: "/login",
      routes: <String, WidgetBuilder>{
        '/': (_) => const HomePage(),
        "/login": (_) => const LoginPage(),
        '/main': (_) => const ManageCards(),
        '/settings': (_) => const ManageCards(),
        '/history': (_) => const History(),
        '/profile': (_) => const Profile(),
      },
    );
  }
}
