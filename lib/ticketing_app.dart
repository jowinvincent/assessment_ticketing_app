import 'package:flutter/material.dart';

import 'feature/ticket/presentation/ticket_list_page.dart';
import 'ticketing_app_route.dart';

class TicketingApp extends StatelessWidget {
  const TicketingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Ticketing App",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: TicketingAppRoute.onGenerateRoute,
      home: const TicketListPage(),
    );
  }
}
