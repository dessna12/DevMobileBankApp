import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

final _url = Uri.parse('http://localhost:8001/api/login');
// final _url = Uri.parse('http://www.omdbapi.com/?i=tt3896198&apikey=edfbaa72');


abstract class AuthenticationDataSource {
  static Future<Map<String,dynamic>> login(String email, String password) async {
    try {
    debugPrint('je suis avant le post email: $email password $password');
      
    final response = await http.post(
      _url,
      headers: <String, String>{
        'Content-Type': 'application/json',
      },      
      body: jsonEncode(<String, String>{
        'email': email,
        'password': password,
      }),
      );

    final Map<String, dynamic> token = jsonDecode(response.body);
    return token;

    } catch (error) {
        // throw Exception('${response.statusCode} - ${response.body}');
        final String errorString = error.toString();
        debugPrint('il y a une erreur $errorString');
          Map<String, dynamic> errorJson = {
            'error': error.toString()};
        return errorJson;
    }

  }
}