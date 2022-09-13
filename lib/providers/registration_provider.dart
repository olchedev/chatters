import 'package:chatters/services/media_service.dart';
import 'package:chatters/services/navigation_service.dart';
import 'package:chatters/utils/app_snackbar_mixin.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class RegistrationProvider extends ChangeNotifier with AppSnackBarMixin {
  bool _isPasswordHidden = true;
  bool get isPasswordHidden => _isPasswordHidden;

  PlatformFile? _profileImage;
  PlatformFile? get profileImage => _profileImage;

  final _nameController = TextEditingController();
  TextEditingController get nameController => _nameController;

  final _emailController = TextEditingController();
  TextEditingController get emailController => _emailController;

  final _passwordController = TextEditingController();
  TextEditingController get passwordController => _passwordController;

  final NavigationService _navigationService =
      GetIt.instance.get<NavigationService>();

  final MediaService _mediaService = GetIt.instance.get<MediaService>();

  void showHidePassword() {
    _isPasswordHidden = !_isPasswordHidden;
    notifyListeners();
  }

  void navigateBackToLoginScreen() =>
      _navigationService.removeAndNavigateToRoute('/login');

  void selectAvatar() async {
    _profileImage = await _mediaService.pickImage();
    notifyListeners();
  }

  void register(GlobalKey<FormState> registerFormKey, BuildContext context) {
    if (isFormValid(registerFormKey)) {
      registerFormKey.currentState!.save();
      registerWithEmail(context);
    }
  }

  bool isFormValid(GlobalKey<FormState> registerFormKey) =>
      registerFormKey.currentState != null &&
      registerFormKey.currentState!.validate();

  Future<void> registerWithEmail(BuildContext context) async {
    try {} catch (error) {
      showAppSnackBar(
        context: context,
        message: 'Something went wrong. Please try again later.',
      );
    }
  }
}
