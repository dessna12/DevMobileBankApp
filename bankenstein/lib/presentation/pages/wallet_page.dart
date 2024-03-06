import 'package:bankenstein/bloc/authentication_cubit.dart';
import 'package:bankenstein/presentation/components/app_bar.dart';
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
          body: Placeholder(),
        );
      } else {
        // Aucun utilisateur connecté
        return const CircularProgressIndicator();
      }
    });
  }
}
