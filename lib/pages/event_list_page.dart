import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../db/events.dart';
import '../pages/create_event_page.dart';
import 'package:logger/logger.dart';
import 'package:firebase_auth/firebase_auth.dart'
    hide EmailAuthProvider, PhoneAuthProvider;
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import '../widgets/authentication.dart';
import '../widgets/auth_widgets.dart';

var logger = Logger(level: Level.warning);

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

  // @override
  // void initState() {
  //   super.initState();
  //   logger.w('in init state');
  // }

  @override
  Widget build(BuildContext context) {
    logger.w(
        'app state model userVerified returns: ${myAppState.model.userVerified()}');
    return Scaffold(
      appBar: AppBar(
        title: const Text('FlatCity Events'),
        actions: [
          Visibility(
            visible: myAppState.model.userVerified(),
            child: ElevatedButton(
              onPressed: () {
                context.push('/add');
              },
              //child: const Text('Add Event'),
              child: const Icon(Icons.add),
            ),
          ),
          Visibility(
            visible: myAppState.model.userVerified(),
            child: ElevatedButton(
              onPressed: () {
                context.push('/profile');
              },
              //child: const Text('Add Event'),
              child: const Icon(Icons.verified_user),
            ),
          ),          
          Visibility(
            visible: !myAppState.model.userVerified(),
            child: ElevatedButton(
              onPressed: () {
                context.push('/sign-in');
               },
              child: const Text('Sign In'),
            ),
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
