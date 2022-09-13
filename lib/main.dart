import 'package:chatters/pages/home_page.dart';
import 'package:chatters/pages/login_page.dart';
import 'package:chatters/pages/register_page.dart';
import 'package:chatters/providers/authentication_provider.dart';
import 'package:chatters/providers/registration_provider.dart';
import 'package:chatters/services/cloud_storage_service.dart';
import 'package:chatters/services/database_service.dart';
import 'package:chatters/services/media_service.dart';
import 'package:chatters/services/navigation_service.dart';
import 'package:chatters/theme/chatters_theme_data.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

void _registerServices() {
  GetIt.instance.registerSingleton<NavigationService>(
    NavigationService(),
  );
  GetIt.instance.registerSingleton<MediaService>(
    MediaService(),
  );
  GetIt.instance.registerSingleton<CloudStorageService>(
    CloudStorageService(),
  );
  GetIt.instance.registerSingleton<DatabaseService>(
    DatabaseService(),
  );
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  _registerServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthenticationProvider>(
          create: (BuildContext _) => AuthenticationProvider(),
        ),
        ChangeNotifierProvider<RegistrationProvider>(
          create: (BuildContext _) => RegistrationProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Chatters',
        theme: const ChattersThemeData().materialTheme,
        navigatorKey: NavigationService.navigatorKey,
        initialRoute: '/login',
        routes: {
          '/login': (BuildContext _) => const LoginPage(),
          '/home': (BuildContext _) => const HomePage(),
          '/register': (BuildContext _) => const RegisterPage(),
        },
      ),
    );
  }
}
