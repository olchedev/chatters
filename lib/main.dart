import 'package:chatters/services/media_service.dart';
import 'package:chatters/services/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';

Future<void> _setUp() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  _registerServices();
}

void _registerServices() {
  GetIt.instance.registerSingleton<NavigationService>(
    NavigationService(),
  );
  GetIt.instance.registerSingleton<MediaService>(
    MediaService(),
  );
}

void main() async {
  _setUp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chatters',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Scaffold(),
    );
  }
}
