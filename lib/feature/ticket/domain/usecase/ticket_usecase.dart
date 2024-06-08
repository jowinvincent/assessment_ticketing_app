import '../entity/ticket.dart';
import '../repository/ticket_repository.dart';

class CreateTicket {
  final TicketRepository repository;

  CreateTicket(this.repository);

  Future<void> call(Ticket ticket) async {
    return await repository.createTicket(ticket);
  }
}

// lib/domain/usecases/get_tickets.dart
class GetTickets {
  final TicketRepository repository;

  GetTickets(this.repository);

  Stream<List<Ticket>> call() {
    return repository.getTickets();
  }
}
