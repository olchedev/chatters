import 'package:chatters/providers/authentication_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    AuthenticationProvider authenticationProvider =
        Provider.of<AuthenticationProvider>(context);

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('I am Home Page'),
          ElevatedButton(
            onPressed: () {
              authenticationProvider.logout();
            },
            child: const Text('Logout'),
          ),
        ],
      ),
    );
  }
}
