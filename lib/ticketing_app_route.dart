import 'package:assessment_ticketing_app/feature/ticket/presentation/create_ticket_page.dart';
import 'package:flutter/material.dart';

class TicketingAppRoute {
  static const String ticketListPage = "TICKET_LIST_PAGE";
  static const String createTicketPage = "CREATE_TICKET_PAGE";

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case createTicketPage:
        return MaterialPageRoute(
          builder: (_) => CreateTicketPage(),
        );
      default:
        return defaultRoute(settings);
    }
  }

  static MaterialPageRoute<dynamic> defaultRoute(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        body: Center(
          child: Text('Page not found：${settings.name}'),
        ),
      ),
    );
  }
}
