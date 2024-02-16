import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

final _url = Uri.parse('/api/login');

abstract class AuthenticationDataSource {
  static Future<String> login(String email, String password) async {
    final response = await http.post(
      _url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },      
      body: jsonEncode(<String, String>{
        'email': email,
        'password': password,
      }),
      
      );
    if (response.statusCode != 200) {
      throw Exception('${response.statusCode} - ${response.body}');
    }

    // final token = jsonDecode(response.body) as List<dynamic>;
    debugPrint(response.body);
    return response.body;
  }
}