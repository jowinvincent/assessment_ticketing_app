import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/repository/ticket_repository_impl.dart';
import '../../data/source/firebase/ticket_firebase_data_source.dart';
import '../../domain/entity/ticket.dart';
import '../../domain/repository/ticket_repository.dart';
import '../../domain/usecase/ticket_usecase.dart';

// Ticket repository provider
final ticketRepositoryProvider = Provider<TicketRepository>((ref) {
  final firestore = FirebaseFirestore.instance;
  final firebaseDataSource = TicketFirebaseDataSourceImpl(firestore: firestore);
  return TicketRepositoryImpl(firebaseDataSource: firebaseDataSource);
});

// Create ticket use case provider
final createTicketProvider = Provider<CreateTicket>((ref) {
  final repository = ref.watch(ticketRepositoryProvider);
  return CreateTicket(repository);
});

// Get tickets use case provider
final getTicketsProvider = Provider<GetTickets>((ref) {
  final repository = ref.watch(ticketRepositoryProvider);
  return GetTickets(repository);
});

// Ticket list stream provider
final ticketListProvider = StreamProvider<List<Ticket>>((ref) {
  return ref.watch(getTicketsProvider).call();
});
