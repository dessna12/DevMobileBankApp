import 'package:bankenstein/data/user_data_source.dart';
import 'package:bankenstein/models/user.dart';
import 'package:bankenstein/service/authentication_service.dart';
import 'package:flutter/material.dart';

abstract class WalletService {
  static Future<UserModel> getUser() async {
    final authenticationService =
        AuthenticationServiceImpl(); // Instancier AuthenticationService
    final String? token = await authenticationService
        .getToken(); // Utiliser l'instance pour appeler getToken()
    debugPrint(token);
    final Map<String, dynamic> userJson = await UserDataSource.user(token!);
    debugPrint(userJson.toString());
    return UserModel.fromJson(userJson);
  }
}
