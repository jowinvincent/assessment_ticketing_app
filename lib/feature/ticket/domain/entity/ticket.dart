class Ticket {
  final String id;
  final String title;
  final String description;
  final String location;
  final DateTime reportedDate;
  final String? attachmentUrl;

  Ticket({
    required this.id,
    required this.title,
    required this.description,
    required this.location,
    required this.reportedDate,
    this.attachmentUrl,
  });
}
