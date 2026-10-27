import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:usermanager/data/models/user.dart';

class UserService {
  final url = 'https://jsonplaceholder.typicode.com/users';

  //recupération des utilisateurs
  Future<List<User>> fetchUser() async {
    try {
      final reponse = await http.get(
        Uri.parse(url),
        headers: {'Accept': 'application/json'},
      );

      if (reponse.statusCode == 200) {
        final List<dynamic> jsonList =
            jsonDecode(reponse.body) as List<dynamic>;
        return jsonList
            .map((json) => User.fromJSON(json as Map<String, dynamic>))
            .toList();
      } else {
        throw Exception('Erreur serveur: ${reponse.statusCode}');
      }
    } catch (e) {
      throw Exception('Erreur connexion: $e');
    }
  }

  //création des utilisateurs
  Future<dynamic> createUser(User user) async {
    try {
      final reponse = await http.post(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(user.toJson()),
      );

      if (reponse.statusCode == 201) {
        log(reponse.body);
      } else {
        throw Exception('Erreur serveur: ${reponse.statusCode}');
      }
    } catch (e) {
      throw Exception('Erreur connexion: $e');
    }
  }

  //suppression d’utilisateur
  Future<dynamic> deleteUser(int userId) async {
    try {
      final http.Response reponse = await http.delete(
        Uri.parse('$url/$userId'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      if (reponse.statusCode == 200) {
        log(reponse.body);
      }
    } catch (e) {
      throw Exception('Erreur connexion: $e');
    }
  }

  //modification du nom des utilisateurs
  Future<void> updateNameUser(int userId, String name) async {
    try {
      final reponse = await http.patch(
        Uri.parse('$url/$userId'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{'name': name}),
      );

      if (reponse.statusCode == 200) {
        log(reponse.body);
      } else {
        throw Exception('Erreur serveur: ${reponse.statusCode}');
      }
    } catch (e) {
      throw Exception('Erreur connexion: $e');
    }
  }

  //modification du pseudo des utilisateurs
  Future<void> updateUsernameUser(int userId, String username) async {
    try {
      final reponse = await http.patch(
        Uri.parse('$url/$userId'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{'username': username}),
      );

      if (reponse.statusCode == 200) {
        log(reponse.body);
      } else {
        throw Exception('Erreur serveur: ${reponse.statusCode}');
      }
    } catch (e) {
      throw Exception('Erreur connexion: $e');
    }
  }

  //modification de l'email des utilisateurs
  Future<void> updateEmailUser(int userId, String email) async {
    try {
      final reponse = await http.patch(
        Uri.parse('$url/$userId'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{'email': email}),
      );

      if (reponse.statusCode == 200) {
        log(reponse.body);
      } else {
        throw Exception('Erreur serveur: ${reponse.statusCode}');
      }
    } catch (e) {
      throw Exception('Erreur connexion: $e');
    }
  }

  //modification du phone des utilisateurs
  Future<void> updatePhoneUser(int userId, String phone) async {
    try {
      final reponse = await http.patch(
        Uri.parse('$url/$userId'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{'phone': phone}),
      );

      if (reponse.statusCode == 200) {
        log(reponse.body);
      } else {
        throw Exception('Erreur serveur: ${reponse.statusCode}');
      }
    } catch (e) {
      throw Exception('Erreur connexion: $e');
    }
  }
}
