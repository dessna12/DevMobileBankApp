import 'package:bankenstein/bloc/authentication_cubit.dart';
import 'package:bankenstein/presentation/components/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  static const name = 'Profile';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationCubit, AuthenticationState>(
    builder: (context, state) {
      if (state is AuthenticationStateAuthenticated) { 
        return Scaffold(
          appBar: MyAppBar(pageName: ProfilePage.name, user: state.user),
          body: Padding(
            padding: ,
            child: 
            )
      );
      } else {
        // Aucun utilisateur connecté
        return const CircularProgressIndicator();
      }
    }
    );
  }
}