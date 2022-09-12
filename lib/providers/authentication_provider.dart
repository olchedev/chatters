import 'package:chatters/models/user_model.dart';
import 'package:chatters/services/database_service.dart';
import 'package:chatters/services/navigation_service.dart';
import 'package:chatters/utils/app_snackbar_mixin.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

class AuthenticationProvider extends ChangeNotifier with AppSnackBarMixin {
  late UserModel _userModel;
  late final FirebaseAuth _auth;
  late final NavigationService _navigationService;
  late final DatabaseService _databaseService;

  final _loginController = TextEditingController();
  TextEditingController get loginController => _loginController;

  final _passwordController = TextEditingController();
  TextEditingController get passwordController => _passwordController;

  AuthenticationProvider() {
    _auth = FirebaseAuth.instance;
    _navigationService = GetIt.instance.get<NavigationService>();
    _databaseService = GetIt.instance.get<DatabaseService>();

    _auth.authStateChanges().listen((user) {
      if (user != null) {
        _databaseService.updateUserLastActive(user.uid);
        _databaseService.getUser(user.uid).then(
          (value) {
            Map<String, dynamic> userData =
                value.data()! as Map<String, dynamic>;

            _userModel = UserModel.fromJson({
              'uid': user.uid,
              'name': userData['name'],
              'email': userData['email'],
              'imageUrl': userData['image'],
              'lastActive': userData['last_active'],
            });

            _navigationService.removeAndNavigateToRoute('/home');
          },
        );
      } else {
        _navigationService.removeAndNavigateToRoute('/login');
      }
    });
  }

  void login(GlobalKey<FormState> loginFormKey, BuildContext context) {
    if (isFormValid(loginFormKey)) {
      loginFormKey.currentState!.save();
      loginWithEmail(context);
    }
  }

  bool isFormValid(GlobalKey<FormState> loginFormKey) =>
      loginFormKey.currentState != null &&
      loginFormKey.currentState!.validate();

  Future<void> loginWithEmail(BuildContext context) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: _loginController.text,
        password: _passwordController.text,
      );
    } on FirebaseAuthException {
      showAppSnackBar(
        context: context,
        message: 'Login failed. Please, check if password and login correct.',
      );
    } catch (error) {
      showAppSnackBar(
        context: context,
        message: 'Something went wrong. Please try again later.',
      );
    }
  }

  void logout() {
    _loginController.clear();
    _passwordController.clear();
    _auth.signOut();
  }

  void navigateToRegisterPage() =>
      _navigationService.navigateToRoute('/register');
}
