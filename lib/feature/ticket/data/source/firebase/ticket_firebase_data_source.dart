// lib/data/datasources/firebase/ticket_firebase_data_source.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../model/ticket_model.dart';

abstract class TicketFirebaseDataSource {
  Future<void> createTicket(TicketModel ticket);
  Stream<List<TicketModel>> getTickets();
}

class TicketFirebaseDataSourceImpl implements TicketFirebaseDataSource {
  final FirebaseFirestore firestore;

  TicketFirebaseDataSourceImpl({required this.firestore});

  @override
  Future<void> createTicket(TicketModel ticket) async {
    await firestore.collection('tickets').doc(ticket.id).set(ticket.toJson());
  }

  @override
  Stream<List<TicketModel>> getTickets() {
    return firestore.collection('tickets').snapshots().map((snapshot) {
      return snapshot.docs
          .map((doc) => TicketModel.fromJson(doc.data()))
          .toList();
    });
  }
}
