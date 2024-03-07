import 'package:bankenstein/models/recipient.dart';
import 'package:flutter/material.dart';

class RecipientTile extends StatelessWidget {
  const RecipientTile({
    required this.recipient,
    super.key});

  final RecipientModel recipient;

  @override
  Widget build(BuildContext context) => Card(
          child: ListTile(
            title: Text(
              recipient.name ?? 'Unknown recipient',
            ),
            subtitle: Text(
              recipient.iban ?? '',
            ),
          ),
        );

}