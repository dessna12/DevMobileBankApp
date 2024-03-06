import 'package:bankenstein/models/wallet.dart';
import 'package:flutter/material.dart';

class WalletListTile extends StatelessWidget {
  const WalletListTile({
    super.key,
    required this.wallet,
  });

  final WalletModel wallet;

  @override
  Widget build(BuildContext context) => Card(
        child: ListTile(
          title: Text(
            wallet.name ?? 'No Name',
          ),
          trailing: Text(
            "${wallet.balance} €",
          ),
        ),
      );
}
