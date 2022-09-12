import 'package:chatters/services/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NavigationService navigationService =
        GetIt.instance.get<NavigationService>();

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('I am Register Page'),
          ElevatedButton(
            onPressed: () {
              navigationService.removeAndNavigateToRoute('/login');
            },
            child: const Text('Back'),
          ),
        ],
      ),
    );
  }
}
