import 'package:bankenstein/models/wallet.dart';
import 'package:bankenstein/presentation/components/wallet_list_tile.dart';
import 'package:flutter/material.dart';

class WalletListView extends StatelessWidget {
  const WalletListView({
    required this.wallet,
    super.key,
  });

  final List<WalletModel> wallet;

  @override
  Widget build(BuildContext context) => ListView.builder(
      itemCount: wallet.length,
      itemBuilder: (context, index) => WalletListTile(
            wallet: wallet.elementAt(index),
          ));
}
