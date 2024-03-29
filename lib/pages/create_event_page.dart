import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import '../db/events.dart';

class CreateEventPage extends StatefulWidget {
  const CreateEventPage({Key? key}) : super(key: key);

  @override
  State<CreateEventPage> createState() => _CreateEventPageState();
}

class _CreateEventPageState extends State<CreateEventPage> {
  final _formKey = GlobalKey<FormBuilderState>();

  final nameController = TextEditingController(text: 'type name here');
  final descriptionController = TextEditingController();
  final locationController = TextEditingController();
  final dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Create Event'),
        ),
        body: FormBuilder(
            key: _formKey,
            child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Title',
                      ),
                      controller: nameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a title';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Date',
                      ),
                      controller: dateController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a date';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Location',
                      ),
                      controller: locationController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a location';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      maxLines: 5,
                      controller: descriptionController,
                      decoration: const InputDecoration(
                        labelText: 'Description',
                      ),
                    ),
                    const SizedBox(height: 8),
                    SubmitButton(onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        print('name: ${nameController.text}');
                        print('name: ${dateController.text}');
                        print('name: ${locationController.text}');
                        print('name: ${descriptionController.text}');
                        print('Form submitted successfully!');
                        // ok ok heat firesto'
                        Event newEvent = Event(
                          title: nameController.text,
                          date: dateController.text,
                          location: locationController.text,
                          description: descriptionController.text,
                        );
                        events.add(newEvent);
                      }
                    }),
                    // const SizedBox(height: 8),
                  ],
                ))));
  }
}

class SubmitButton extends StatelessWidget {
  const SubmitButton({
    Key? key,
    required this.onPressed,
    this.text = 'Submit',
  }) : super(key: key);

  final VoidCallback onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(text),
    );
  }
}
