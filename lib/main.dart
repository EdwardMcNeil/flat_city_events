import 'package:flutter/material.dart';
import 'create_event_page.dart';

class Event {
  final String title;
  final String date;
  final String location;
  final String description;
  final String imageUrl;

  const Event({
    required this.title,
    required this.date,
    required this.location,
    required this.description,
    required this.imageUrl,
  });
}

class EventsList extends StatefulWidget {
  const EventsList({super.key});

  @override
  State<EventsList> createState() => _EventsListState();
}

class _EventsListState extends State<EventsList> {
  final List<Event> events = [
    Event(
      title: 'Community Hackathon',
      date: '2023-11-25',
      location: 'Flutter HQ, San Francisco',
      description:
          'Join us for a day of hacking and learning with fellow Flutter developers.',
      imageUrl: 'https://via.placeholder.com/300x200',
    ),
    Event(
      title: 'Flutter Meetup',
      date: '2023-12-02',
      location: 'Google Cloud Office, New York',
      description:
          'Come network with other Flutter enthusiasts and learn about the latest developments.',
      imageUrl: 'https://via.placeholder.com/300x200',
    ),
    Event(
      title: 'Flutter Workshop',
      date: '2023-12-09',
      location: 'Amazon Web Services Office, Seattle',
      description:
          'Get hands-on experience with Flutter in this beginner-friendly workshop.',
      imageUrl: 'https://via.placeholder.com/300x200',
    ),
    Event(
      title: 'Community Hackathon',
      date: '2023-11-25',
      location: 'Flutter HQ, San Francisco',
      description:
          'Join us for a day of hacking and learning with fellow Flutter developers.',
      imageUrl: 'https://via.placeholder.com/300x200',
    ),
    Event(
      title: 'Flutter Meetup',
      date: '2023-12-02',
      location: 'Google Cloud Office, New York',
      description:
          'Come network with other Flutter enthusiasts and learn about the latest developments.',
      imageUrl: 'https://via.placeholder.com/300x200',
    ),
    Event(
      title: 'Flutter Workshop',
      date: '2023-12-09',
      location: 'Amazon Web Services Office, Seattle',
      description:
          'Get hands-on experience with Flutter in this beginner-friendly workshop.',
      imageUrl: 'https://via.placeholder.com/300x200',
    ),
    Event(
      title: 'Community Hackathon',
      date: '2023-11-25',
      location: 'Flutter HQ, San Francisco',
      description:
          'Join us for a day of hacking and learning with fellow Flutter developers.',
      imageUrl: 'https://via.placeholder.com/300x200',
    ),
    Event(
      title: 'Flutter Meetup',
      date: '2023-12-02',
      location: 'Google Cloud Office, New York',
      description:
          'Come network with other Flutter enthusiasts and learn about the latest developments.',
      imageUrl: 'https://via.placeholder.com/300x200',
    ),
    Event(
      title: 'Flutter Workshop',
      date: '2023-12-09',
      location: 'Amazon Web Services Office, Seattle',
      description:
          'Get hands-on experience with Flutter in this beginner-friendly workshop.',
      imageUrl: 'https://via.placeholder.com/300x200',
    ),
    Event(
      title: 'Community Hackathon',
      date: '2023-11-25',
      location: 'Flutter HQ, San Francisco',
      description:
          'Join us for a day of hacking and learning with fellow Flutter developers.',
      imageUrl: 'https://via.placeholder.com/300x200',
    ),
    Event(
      title: 'Flutter Meetup',
      date: '2023-12-02',
      location: 'Google Cloud Office, New York',
      description:
          'Come network with other Flutter enthusiasts and learn about the latest developments.',
      imageUrl: 'https://via.placeholder.com/300x200',
    ),
    Event(
      title: 'Flutter Workshop',
      date: '2023-12-09',
      location: 'Amazon Web Services Office, Seattle',
      description:
          'Get hands-on experience with Flutter in this beginner-friendly workshop.',
      imageUrl: 'https://via.placeholder.com/300x200',
    ),
    Event(
      title: 'Community Hackathon',
      date: '2023-11-25',
      location: 'Flutter HQ, San Francisco',
      description:
          'Join us for a day of hacking and learning with fellow Flutter developers.',
      imageUrl: 'https://via.placeholder.com/300x200',
    ),
    Event(
      title: 'Flutter Meetup',
      date: '2023-12-02',
      location: 'Google Cloud Office, New York',
      description:
          'Come network with other Flutter enthusiasts and learn about the latest developments.',
      imageUrl: 'https://via.placeholder.com/300x200',
    ),
    Event(
      title: 'Flutter Workshop',
      date: '2023-12-09',
      location: 'Amazon Web Services Office, Seattle',
      description:
          'Get hands-on experience with Flutter in this beginner-friendly workshop.',
      imageUrl: 'https://via.placeholder.com/300x200',
    ),
    Event(
      title: 'Community Hackathon',
      date: '2023-11-25',
      location: 'Flutter HQ, San Francisco',
      description:
          'Join us for a day of hacking and learning with fellow Flutter developers.',
      imageUrl: 'https://via.placeholder.com/300x200',
    ),
    Event(
      title: 'Flutter Meetup',
      date: '2023-12-02',
      location: 'Google Cloud Office, New York',
      description:
          'Come network with other Flutter enthusiasts and learn about the latest developments.',
      imageUrl: 'https://via.placeholder.com/300x200',
    ),
    Event(
      title: 'Flutter Workshop',
      date: '2023-12-09',
      location: 'Amazon Web Services Office, Seattle',
      description:
          'Get hands-on experience with Flutter in this beginner-friendly workshop.',
      imageUrl: 'https://via.placeholder.com/300x200',
    ),
    Event(
      title: 'Community Hackathon',
      date: '2023-11-25',
      location: 'Flutter HQ, San Francisco',
      description:
          'Join us for a day of hacking and learning with fellow Flutter developers.',
      imageUrl: 'https://via.placeholder.com/300x200',
    ),
    Event(
      title: 'Flutter Meetup',
      date: '2023-12-02',
      location: 'Google Cloud Office, New York',
      description:
          'Come network with other Flutter enthusiasts and learn about the latest developments.',
      imageUrl: 'https://via.placeholder.com/300x200',
    ),
    Event(
      title: 'Flutter Workshop',
      date: '2023-12-09',
      location: 'Amazon Web Services Office, Seattle',
      description:
          'Get hands-on experience with Flutter in this beginner-friendly workshop.',
      imageUrl: 'https://via.placeholder.com/300x200',
    ),
    Event(
      title: 'Community Hackathon',
      date: '2023-11-25',
      location: 'Flutter HQ, San Francisco',
      description:
          'Join us for a day of hacking and learning with fellow Flutter developers.',
      imageUrl: 'https://via.placeholder.com/300x200',
    ),
    Event(
      title: 'Flutter Meetup',
      date: '2023-12-02',
      location: 'Google Cloud Office, New York',
      description:
          'Come network with other Flutter enthusiasts and learn about the latest developments.',
      imageUrl: 'https://via.placeholder.com/300x200',
    ),
    Event(
      title: 'Flutter Workshop',
      date: '2023-12-09',
      location: 'Amazon Web Services Office, Seattle',
      description:
          'Get hands-on experience with Flutter in this beginner-friendly workshop.',
      imageUrl: 'https://via.placeholder.com/300x200',
    ),
  ];

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

void main() {
  runApp(MaterialApp(
    home: EventsList(),
  ));
}
