import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import '../firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart'
    hide EmailAuthProvider, PhoneAuthProvider;
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
//import 'dart.io';
import 'package:logger/logger.dart';
import '../pages/create_event_page.dart';

var logger = Logger(level: Level.warning);

class ApplicationState extends ChangeNotifier {
  ApplicationState() {}
  bool loggedIn = false;
  bool emailVerified = false;
  bool userIsAdmin = false;
  String userId = '';
  Future<ApplicationState> initDb() async {
    logger.d('Heloghewo');
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    FirebaseUIAuth.configureProviders([
      EmailAuthProvider(),
    ]);
    FirebaseAuth.instance.userChanges().listen((user) async {
      logger.d('got user $user');
      if (user != null) {
        if (user.emailVerified) {
          emailVerified = true;
          loggedIn = true;
          if (loggedIn) {
            setUserRole();
          }
        }
      }
      notifyListeners();
    });
    return this;
  }

  void setUserRole() {
    if (emailVerified && loggedIn) {
      String email = FirebaseAuth.instance.currentUser?.email ?? "Nothing";
      if (email == 'tortoise.effendi@gmail.com') {
        userIsAdmin = true;
      }
    }
  }

  String getInitialForCurrentUser() {
    String email = FirebaseAuth.instance.currentUser?.displayName ?? '';
    String result = email.isNotEmpty ? email.substring(0, 1) : 'You';
    return result;
  }

  Future<void> refreshLoggedInUser() async {
    final currentUser = FirebaseAuth.instance.currentUser;

    if (currentUser == null) {
      return;
    }
    logger.d('waiting for current user refresh');
    await currentUser.reload();
    logger.d('got currentUser refresh');
    userId = currentUser.uid;
    setUserRole();
    logger.d('user role is admin: $userIsAdmin');
  }
} // end ApplicationState

class Event {
  final String title;
  final String date;
  final String location;
  final String description;
  final String? imageUrl;

  const Event({
    required this.title,
    required this.date,
    required this.location,
    required this.description,
    this.imageUrl,
  });
}

List<Event> events = [
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
