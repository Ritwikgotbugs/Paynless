import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

typedef Runner = FutureOr<void> Function();

class FlutterInitSDK {
  static Future<void> initialize(Runner runnner) async {
    WidgetsFlutterBinding.ensureInitialized();

    await dotenv.load(fileName: ".env");

    if (dotenv.env['SUPABASE_URL'] == null ||
        dotenv.env['SUPABASE_ANON_KEY'] == null) {
      throw Exception(
        'Please add SUPABASE_URL and SUPABASE_ANON_KEY to your .env file',
      );
    }

    await Supabase.initialize(
      url: dotenv.env['SUPABASE_URL']!,
      anonKey: dotenv.env['SUPABASE_ANON_KEY']!,
    );

    await runnner();
  }
}
