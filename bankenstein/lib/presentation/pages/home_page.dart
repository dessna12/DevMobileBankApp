import 'package:bankenstein/bloc/authentication_cubit.dart';
import 'package:bankenstein/presentation/components/app_bar.dart';
import 'package:bankenstein/presentation/components/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static const name = 'Home';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isDarkMode = false;

  // void _toggleDarkMode() {
  //   setState(() {
  //     _isDarkMode = !_isDarkMode;
  //   });
  // }
  
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationCubit, AuthenticationState>(
      builder: (context, state) {
      if (state is AuthenticationStateAuthenticated) { 
        return Scaffold(
          appBar: MyAppBar(pageName: HomePage.name, user: state.user),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child:
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Welcome ${state.user.name}',
                      style: const TextStyle(
                        fontSize: 25,
                      ),
                    ),
                    const SizedBox(height: 8,),
                    const Text(
                      'Use the navigation bar to go to your accounts or to transfer money',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ],
                )
            ),
          ),
          bottomNavigationBar: MyBottomNavBar(),
        );
        } else {
            // Aucun utilisateur connecté
            return const CircularProgressIndicator();
        }
      },
    );
  }
}