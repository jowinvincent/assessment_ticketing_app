import 'package:assessment_ticketing_app/ticketing_app_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'provider/ticket_provider.dart';

class TicketListPage extends ConsumerWidget {
  const TicketListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ticketListAsyncValue = ref.watch(ticketListProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Tickets')),
      body: ticketListAsyncValue.when(
        data: (tickets) => ListView.separated(
          itemCount: tickets.length,
          itemBuilder: (context, index) {
            final ticket = tickets[index];
            return ListTile(
              title: Text(ticket.title),
              subtitle: Text(ticket.description),
            );
          },
          separatorBuilder: (_, __) {
            return const Divider(height: 4);
          },
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Error: $error')),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            Navigator.pushNamed(context, TicketingAppRoute.createTicketPage),
        child: const Icon(Icons.add),
      ),
    );
  }
}
