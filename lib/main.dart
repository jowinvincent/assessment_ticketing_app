import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'firebase_options.dart';
import 'ticketing_app.dart';

void main() async {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    runApp(const ProviderScope(
      child: TicketingApp(),
    ));
  }, (error, stackTrace) {
    // Handle error
    debugPrint('Caught error: $error');
    debugPrint('Stack trace: $stackTrace');
  });
}
