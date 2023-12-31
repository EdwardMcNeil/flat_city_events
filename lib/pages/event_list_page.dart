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
        title: const Text('Flathead County Community Events'),
        actions: [
          Visibility(
            visible: myAppState.model.userVerified(),
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const CreateEventPage(),
                  ),
                );
              },
              child: const Text('Add Event'),
            ),
          ),
          Visibility(
            visible: !myAppState.model.userVerified(),
            child: ElevatedButton(
              onPressed: () {
                // context.push('/sign-in');
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return SignInScreen(
                        headerBuilder: (context, constraints, _) {
                          return AppBar(title: const Text('Profile'));
                        },
                        actions: [
                          ForgotPasswordAction(((context, email) {
                            final uri = Uri(
                              path: '/sign-in/forgot-password',
                              queryParameters: <String, String?>{
                                'email': email,
                              },
                            );
                            context.push(uri.toString());
                          })),
                          AuthStateChangeAction(((context, state) {
                            final user = switch (state) {
                              SignedIn state => state.user,
                              UserCreated state => state.credential.user,
                              _ => null
                            };
                            if (user == null) {
                              return;
                            }
                            if (state is UserCreated) {
                              user.updateDisplayName(user.email!.split('@')[0]);
                            }
                            if (!user.emailVerified) {
                              user.sendEmailVerification();
                              const snackBar = SnackBar(
                                  content: Text(
                                      'Please check your email to verify your email address'));
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            } else {
                              // user is authenticated
                              logger.d('fully authenticated user: $user');
                            }
                            // KAIZA context.pushReplacement('/');
                          })),
                        ],
                      );
                    },
                  ),
                );
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
