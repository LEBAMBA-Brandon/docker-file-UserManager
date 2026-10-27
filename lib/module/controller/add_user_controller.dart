import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get_x/get.dart';
import 'package:usermanager/data/models/user.dart';
import 'package:usermanager/data/repository/user_repository.dart';

class AddUserController extends GetxController {
  final Rxn<User> currentUser = Rxn<User>();

  final UserRepository _userRepository = UserRepository();
  UserRepository get userRepository => _userRepository;

  final isLoading = false.obs;
  final errorMessage = RxnString();

  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final nameFocus = FocusNode();
  final usernameFocus = FocusNode();
  final emailFocus = FocusNode();
  final phoneFocus = FocusNode();

  @override
  void onInit() {
    super.onInit();
    log('onInit: le controller d’ajout d’utilisateur a été créé avec succès');
  }

  @override
  void onReady() {
    super.onReady();
    log('onReady: l’interface d’ajout d’utilisateur s’affiche avec succès');
  }

  @override
  void onClose() {
    super.onClose();
    log(
      'onClose: le controller d’ajout d’utilisateur a été détruit avec succès',
    );

    nameController.dispose();
    usernameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    nameFocus.dispose();
    usernameFocus.dispose();
    emailFocus.dispose();
    phoneFocus.dispose();
  }

  Future<bool> postUsers() async {
    isLoading.value = true;
    errorMessage.value = null;

    currentUser.value = User(
      id: DateTime.now().millisecondsSinceEpoch,
      name: nameController.text,
      username: usernameController.text,
      email: emailController.text,
      phone: phoneController.text,
    );

    try {
      await userRepository.postUser(currentUser.value!);
      return true;
    } catch (e) {
      errorMessage.value = e.toString();
      return false;
    } finally {
      isLoading.value = false;
    }
  }
}
