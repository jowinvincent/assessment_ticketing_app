import '../entity/ticket.dart';

abstract class TicketRepository {
  Future<void> createTicket(Ticket ticket);
  Stream<List<Ticket>> getTickets();
}
