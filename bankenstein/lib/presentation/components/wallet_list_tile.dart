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
        child: GestureDetector(
          onTap: () {
            // Ajoutez ici le code à exécuter lors du clic sur la carte
            print('+1');
          },
          child: ListTile(
            title: Text(
              wallet.name ?? 'No Name',
            ),
            trailing: Text(
              "${wallet.balance} €",
            ),
          ),
        ),
      );
}
