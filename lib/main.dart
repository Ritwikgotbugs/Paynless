import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paynless/screens/history.dart';
import 'package:paynless/screens/home_page.dart';
import 'package:get/get.dart';
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
      theme: ThemeData(
        useMaterial3: true,
        textTheme: GoogleFonts.dmSansTextTheme(),
      ),
      initialRoute: "/",
      routes: <String, WidgetBuilder>{
        '/': (_) => const HomePage(),
        '/main': (_) => const ManageCards(),
        '/settings': (_) => const ManageCards(),
        '/history': (_) => const History(),
        '/profile': (_) => const Profile(),
      },
    );
  }
}
