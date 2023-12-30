import 'package:flutter/material.dart';
import '../db/events.dart';
import '../pages/create_event_page.dart';
import 'package:logger/logger.dart';

var logger = Logger(level: Level.warning);

class MyApplicationStateInitializer {
  late ApplicationState model;
  Future<ApplicationState> init() async {
    ApplicationState x = ApplicationState();
    model = await x.initDb();
    return model;
  }
}

class EventsListPage extends StatefulWidget {
  const EventsListPage({super.key});

  @override
  State<EventsListPage> createState() => _EventsListPageState();
}

class _EventsListPageState extends State<EventsListPage> {
  MyApplicationStateInitializer applicationStateInitializer =
      MyApplicationStateInitializer();
  void refreshMe() {
    setState(() {});
  }

  @override
  void initState() {
    applicationStateInitializer.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flathead County Community Events'),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const CreateEventPage(),
                ),
              );
            },
            child: const Text('Add Event'),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: events.length,
        itemBuilder: (context, index) {
          final event = events[index];
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    event.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text('Date: ${event.date}'),
                  const SizedBox(height: 8),
                  Text('Location: ${event.location}'),
                  const SizedBox(height: 8),
                  Text(event.description),
                  const SizedBox(height: 8),
                  // -- event.imageUrl.isNotEmpty
                  // --     ? Image.network(event.imageUrl)
                  // --     : const Text('')
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
