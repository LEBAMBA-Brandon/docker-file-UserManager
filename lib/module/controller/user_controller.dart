import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get_x/get.dart';
import 'package:usermanager/data/models/user.dart';
import 'package:usermanager/data/repository/user_repository.dart';

class UserController extends GetxController {
  final UserRepository _userRepository = UserRepository();
  UserRepository get userRepository => _userRepository;

  final isLoading = false.obs;
  final errorMessage = RxnString();
  final users = <User>[].obs;

  final formKey = GlobalKey<FormState>();
  final nameUpdateController = TextEditingController();
  final usernameUpdateController = TextEditingController();
  final emailUpdateController = TextEditingController();
  final phoneUpdateController = TextEditingController();
  final nameUpdateFocus = FocusNode();
  final usernameUpdateFocus = FocusNode();
  final emailUpdateFocus = FocusNode();
  final phoneUpdateFocus = FocusNode();

  late final Future<List<User>> futurUser;
  var theme = false.obs;

  @override
  void onInit() {
    super.onInit();
    log(
      'onInit: le controller de modification d’utilisateur a été créé avec succès',
    );
    getUsers();
  }

  @override
  void onReady() {
    super.onReady();
    log('onReady: l’interface des utilisateurs s’affiche avec succès');
  }

  @override
  void onClose() {
    super.onClose();
    log(
      'onClose: le controller de modification d’utilisateur a été détruit avec succès',
    );

    nameUpdateController.dispose();
    usernameUpdateController.dispose();
    emailUpdateController.dispose();
    phoneUpdateController.dispose();
    nameUpdateFocus.dispose();
    usernameUpdateFocus.dispose();
    emailUpdateFocus.dispose();
    phoneUpdateFocus.dispose();
  }

  void changeTheme() {
    theme.value = !theme.value;
  }

  Future<void> getUsers() async {
    isLoading.value = true;
    errorMessage.value = null;

    try {
      final fetchedUsers = await _userRepository.getUser();
      users.assignAll(fetchedUsers);
    } catch (e) {
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  Future<bool> deleteUsers(int userId) async {
    isLoading.value = true;
    errorMessage.value = null;

    try {
      await _userRepository.deleteUser(userId);
      users.removeWhere((u) => u.id == userId);
      return true;
    } catch (e) {
      errorMessage.value = e.toString();
      return false;
    } finally {
      isLoading.value = false;
    }
  }

  Future<bool> updateUsers(int userId) async {
    isLoading.value = true;
    errorMessage.value = null;

    try {
      await _userRepository.updateUser(
        userId,
        name: nameUpdateController.text.trim(),
        username: usernameUpdateController.text.trim(),
        email: emailUpdateController.text.trim(),
        phone: phoneUpdateController.text.trim(),
      );

      final index = users.indexWhere((u) => u.id == userId);
      if (index != -1) {
        users[index] = users[index].copyWith(
          name: nameUpdateController.text.trim(),
          username: usernameUpdateController.text.trim(),
          email: emailUpdateController.text.trim(),
          phone: phoneUpdateController.text.trim(),
        );
      }
      return true;
    } catch (e) {
      errorMessage.value = e.toString();
      return false;
    } finally {
      isLoading.value = false;
    }
  }

  void addUserLocal(User user) {
    users.add(user);
  }
}
