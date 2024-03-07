import 'package:bankenstein/data/recipient_data_source.dart';
import 'package:bankenstein/models/recipient.dart';
import 'package:bankenstein/service/authentication_service.dart';
import 'package:flutter/material.dart';

abstract class RecipientService {
  static Future<List<RecipientModel>> recipients() async {

    final authenticationService = AuthenticationServiceImpl();
    final String? token = await authenticationService.getToken();
    final List<Map<String, dynamic>> recipientsJson = await RecipientDataSource.recipients(token!);
    final List<RecipientModel> recipients = recipientsJson.map((recipient) => RecipientModel.fromJson(recipient)).toList();
    return recipients;
  }

}