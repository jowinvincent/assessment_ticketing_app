import 'package:assessment_ticketing_app/feature/ticket/data/model/ticket_model.dart';

import '../../domain/entity/ticket.dart';
import '../../domain/repository/ticket_repository.dart';
import '../source/firebase/ticket_firebase_data_source.dart';

class TicketRepositoryImpl implements TicketRepository {
  final TicketFirebaseDataSource firebaseDataSource;

  TicketRepositoryImpl({required this.firebaseDataSource});

  @override
  Future<void> createTicket(Ticket ticket) async {
    final ticketModel = TicketModel(
      id: ticket.id,
      title: ticket.title,
      description: ticket.description,
      location: ticket.location,
      reportedDate: ticket.reportedDate,
      attachmentUrl: ticket.attachmentUrl,
    );
    await firebaseDataSource.createTicket(ticketModel);
  }

  @override
  Stream<List<Ticket>> getTickets() {
    return firebaseDataSource.getTickets().map((ticketModels) {
      return ticketModels
          .map((model) => Ticket(
                id: model.id,
                title: model.title,
                description: model.description,
                location: model.location,
                reportedDate: model.reportedDate,
                attachmentUrl: model.attachmentUrl,
              ))
          .toList();
    });
  }
}
