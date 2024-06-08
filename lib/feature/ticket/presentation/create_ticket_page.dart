import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../domain/entity/ticket.dart';
import 'provider/ticket_provider.dart';

class CreateTicketPage extends ConsumerWidget {
  CreateTicketPage({super.key});

  final _formKey = GlobalKey<FormState>();

  final _titleController = TextEditingController();

  final _descriptionController = TextEditingController();

  final _locationController = TextEditingController();

  final _dateController = TextEditingController();

  final _attachmentUrlController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('dd-MM-yyyy').format(now);
    _dateController.text = formattedDate;

    return Scaffold(
      appBar: AppBar(title: const Text('Create Ticket')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(
                    labelText: 'Title', border: OutlineInputBorder()),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a title';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                controller: _descriptionController,
                decoration: const InputDecoration(
                    labelText: 'Description', border: OutlineInputBorder()),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a description';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                controller: _locationController,
                decoration: const InputDecoration(
                    labelText: 'Location', border: OutlineInputBorder()),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a location';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                controller: _dateController,
                readOnly: true,
                decoration: const InputDecoration(border: OutlineInputBorder()),
                validator: (value) {
                  return null;
                },
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                controller: _attachmentUrlController,
                decoration: const InputDecoration(
                    labelText: 'Attachment Url', border: OutlineInputBorder()),
                validator: (value) {
                  return null;
                },
              ),
              const SizedBox(
                height: 16,
              ),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    final newTicket = Ticket(
                      id: DateTime.now().millisecondsSinceEpoch.toString(),
                      title: _titleController.text,
                      description: _descriptionController.text,
                      location: _locationController.text,
                      reportedDate: now,
                      attachmentUrl: _attachmentUrlController.text,
                    );

                    await ref
                        .read(ticketRepositoryProvider)
                        .createTicket(newTicket);
                    if (context.mounted) {
                      return Navigator.pop(context);
                    }
                  }
                },
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
