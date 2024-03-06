import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

final _url = Uri.parse('http://localhost:8001/api/me/accounts');

abstract class WalletDataSource {
  static Future<Map<String, dynamic>> user(String token) async {
    try {
      final response = await http.get(_url, headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      });
      if (response.statusCode != 200) {
        throw Exception('${response.statusCode} - ${response.body}');
      }

      final Map<String, dynamic> wallet = jsonDecode(response.body);
      return wallet;
    } catch (error) {
      final String errorString = error.toString();
      debugPrint('il y a une erreur $errorString');
      Map<String, dynamic> errorJson = {'error': error.toString()};
      return errorJson;
    }
  }
}
