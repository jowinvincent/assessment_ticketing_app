import '../../domain/entity/ticket.dart';

class TicketModel extends Ticket {
  TicketModel({
    required super.id,
    required super.title,
    required super.description,
    required super.location,
    required super.reportedDate,
    super.attachmentUrl,
  });

  factory TicketModel.fromJson(Map<String, dynamic> json) {
    return TicketModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      location: json['location'],
      reportedDate: DateTime.parse(json['reportedDate']),
      attachmentUrl: json['attachmentUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'location': location,
      'reportedDate': reportedDate.toIso8601String(),
      'attachmentUrl': attachmentUrl,
    };
  }
}
