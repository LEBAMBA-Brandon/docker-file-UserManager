import 'package:usermanager/data/models/user.dart';
import 'package:usermanager/data/service/user_service.dart';

class UserRepository {
  final UserService _userService = UserService();

  //recupérer les users
  Future<List<User>> getUser() async {
    try {
      final getUtilisateur = await _userService.fetchUser();

      return getUtilisateur;
    } catch (e) {
      throw Exception('Impossible de charger les utilisateurs: $e');
    }
  }

  //ajouter user
  Future<void> postUser(User user) async {
    try {
      await _userService.createUser(user);
    } catch (e) {
      throw Exception('Echec de création de l\'utilisateur: $e');
    }
  }

  //supprimer user
  Future<void> deleteUser(int userId) async {
    try {
      await _userService.deleteUser(userId);
    } catch (e) {
      throw Exception('Echec de suppression: $e');
    }
  }

  //modifier user
  Future<void> updateUser(
    int userId, {
    String? name,
    String? username,
    String? email,
    String? phone,
  }) async {
    try {
      if (name != null) await _userService.updateNameUser(userId, name);
      if (username != null) {
        await _userService.updateUsernameUser(userId, username);
      }
      if (email != null) await _userService.updateEmailUser(userId, email);
      if (phone != null) await _userService.updatePhoneUser(userId, phone);
    } catch (e) {
      throw Exception('Echec de modification: $e');
    }
  }
}
