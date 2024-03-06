import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:bankenstein/bloc/authentication_cubit.dart';
import 'package:bankenstein/presentation/components/app_bar.dart';
import 'package:bankenstein/presentation/components/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  static const String name = 'Settings';
  static const List<Widget> icons = <Widget>[
    Icon(Icons.light_mode),
    Icon(Icons.dark_mode),
  ];



  @override
  State<SettingsPage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationCubit, AuthenticationState>(
    builder: (context, state) {
    if (state is AuthenticationStateAuthenticated) { 
      return Scaffold(
        appBar: MyAppBar(pageName: SettingsPage.name, user: state.user),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              children: [
                  Row(
                    children: [
                      Icon(
                        AdaptiveTheme.of(context).mode.isDark? Icons.dark_mode : Icons.light_mode
                      ),
                      const SizedBox(width: 8),
                      const Text('Theme Mode',
                        style: TextStyle(
                          fontSize: 20),
                      ),
                      const Spacer(),
                      Switch(
                        value: AdaptiveTheme.of(context).mode.isDark,
                        onChanged: (value) {
                          AdaptiveTheme.of(context).toggleThemeMode();
                        },
                        inactiveTrackColor: Theme.of(context).primaryColor,
                        inactiveThumbColor: Colors.grey[300],
                        trackOutlineColor: MaterialStateProperty.resolveWith(
                          (final Set<MaterialState> states) {
                            if (states.contains(MaterialState.selected)) {
                              return null;
                            }
                            return Theme.of(context).primaryColor;
                          },
                        ),
                      ),
                    ]),
                    const SizedBox(height: 16),
                    const Row(
                      children: [
                      Text('Language Preference',
                        style: TextStyle(
                          fontSize: 20),
                      ),
                      Spacer(),
                      Icon(
                        Icons.language
                      ),
                    ]),
                  const SizedBox(height: 8,),
              ]),
          ),
        ),
        bottomNavigationBar: MyBottomNavBar(),
      );
    } else {
      // Aucun utilisateur connecté
      return const CircularProgressIndicator();
    }
  });
  } 
}