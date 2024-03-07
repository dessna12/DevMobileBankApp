import 'package:bankenstein/bloc/authentication_cubit.dart';
import 'package:bankenstein/bloc/recipient_cubit.dart';
import 'package:bankenstein/presentation/components/app_bar.dart';
import 'package:bankenstein/presentation/components/recipient_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecipientPage extends StatelessWidget {
  const RecipientPage({super.key});

  static const name = 'Profile';

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RecipientCubit>(
      // lazy: false,
      create: (_) {
        final vehiculeCubit = RecipientCubit();
        vehiculeCubit.getRecipients();
        return vehiculeCubit;
      },
      child: BlocBuilder<AuthenticationCubit, AuthenticationState>(
      builder: (context, state) {    
          if (state is AuthenticationStateAuthenticated) { 
              return Scaffold(
                appBar: MyAppBar(pageName: RecipientPage.name, user: state.user),
                body: BlocBuilder<RecipientCubit, RecipientState>(
                  builder: (context, state) {
                    if (state is RecipientStateLoaded) {
                      return RecipientList(recipients: state.recipients);
                    }

                    if (state is RecipientStateInitial) {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: Colors.purple,
                        ),
                      );
                    }

                    if (state is RecipientStateError) {
                      return Center(
                        child: Text(state.message),
                      );
                    }

                    // Handle other states if necessary

                    return Container(); // Default return if none of the conditions are met
                  },
                ),
              );
            } else {
              // No authenticated user
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ));
      }
}