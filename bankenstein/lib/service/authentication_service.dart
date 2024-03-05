import 'package:bankenstein/data/authentication_data_source.dart';
import 'package:bankenstein/data/user_data_source.dart';
import 'package:bankenstein/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';


// abstract class AuthenticationService {


//   static Future<String> getTokenFromApi(String email, String password) async {
//     final tokenJson = await AuthenticationDataSource.login(email, password);
//     final String token = tokenJson[0];
//     return token;
//   }

//   final storage = const FlutterSecureStorage();

//   Future<void> saveToken(String email, String password) async {
//     final String token = await AuthenticationService.getTokenFromApi(email, password);
//     await storage.write(key: 'token', value: token);
//   }

//   Future<String?> getToken() async {
//     return await storage.read(key: 'token');
//   }


// }


abstract class AuthenticationService {
  Future<String> getTokenFromApi(String email, String password);
  Future<void> saveToken(String email, String password);
  Future<String?> getToken();
}

class AuthenticationServiceImpl extends AuthenticationService {
  final storage = const FlutterSecureStorage();

  @override
  Future<String> getTokenFromApi(String email, String password) async {
    debugPrint('Try to sign In with $email - $password');
    final tokenJson = await AuthenticationDataSource.login(email, password);
    final String token = tokenJson['access_token'];
    return token;
  }

  @override
  Future<void> saveToken(String email, String password) async {
    final String token = await getTokenFromApi(email, password);
    await storage.write(key: 'token', value: token);
  }

  @override
  Future<String?> getToken() async {
    return await storage.read(key: 'token');
  }
}
