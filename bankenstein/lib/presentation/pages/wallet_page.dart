import 'package:bankenstein/bloc/authentication_cubit.dart';
import 'package:bankenstein/bloc/wallet_cubit.dart';
import 'package:bankenstein/presentation/components/app_bar.dart';
import 'package:bankenstein/presentation/components/wallet_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WalletPage extends StatelessWidget {
  const WalletPage({super.key});

  static const name = 'Accounts';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationCubit, AuthenticationState>(
        builder: (context, state) {
      if (state is AuthenticationStateAuthenticated) {
        return Scaffold(
            appBar: MyAppBar(pageName: WalletPage.name, user: state.user),
            body: BlocProvider<WalletCubit>(
              // sert à lancer un builder même si il est pas instancier
              // lazy: false,
              create: (_) {
                final walletCubit = WalletCubit();
                walletCubit.getWallet();
                return walletCubit;
              },
              child: BlocBuilder<WalletCubit, WalletState>(
                  builder: (context, state) {
                if (state is WalletStateLoaded) {
                  const Placeholder();
                  return WalletListView(wallet: state.wallet);
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }),
            )
            //     BlocBuilder<WalletCubit, WalletState>(builder: (context, state) {
            //   if (state is WalletStateLoaded) {
            //     Placeholder();
            //   }
            //   return const Center(
            //     child: CircularProgressIndicator(),
            //   );
            // }),
            );
      } else {
        // Aucun utilisateur connecté
        return const CircularProgressIndicator();
      }
    });
  }
}
