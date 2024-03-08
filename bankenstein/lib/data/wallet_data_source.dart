import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

final _url = Uri.parse('http://localhost:8001/api/me/accounts');

abstract class WalletDataSource {
  static Future<List<Map<String, dynamic>>> walletDataSource(
      String token) async {
    final response = await http.get(_url, headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token',
    });
    if (response.statusCode != 200) {
      throw Exception('${response.statusCode} - ${response.body}');
    }
    final wallet = jsonDecode(response.body) as List<dynamic>;
    return wallet.map((e) => e as Map<String, dynamic>).toList();
  }
}
