import 'package:bankenstein/models/recipient.dart';
import 'package:bankenstein/presentation/components/recipient_tile.dart';
import 'package:flutter/material.dart';

class RecipientList extends StatelessWidget {
  const RecipientList({
    required this.recipients,
    super.key,
  });


  final List<RecipientModel> recipients;

  @override
  Widget build(BuildContext context) => ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: recipients.length,
        itemBuilder: (context, index) => RecipientTile(
          recipient: recipients.elementAt(index),
        ),
      );
}
