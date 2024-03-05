import 'package:bankenstein/bloc/authentication_cubit.dart';
import 'package:bankenstein/router/router.dart';
import 'package:bankenstein/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
  return BlocProvider<AuthenticationCubit>(
      lazy: false,
      create: (_) {
        final cubit = AuthenticationCubit();
        return cubit;
      },
      child: Builder(builder: (context) {
      return MaterialApp.router(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(0, 19, 14, 23)),
            useMaterial3: true,
          ),
          routerConfig: AppRouter.router(context),
        );        
      }
    ));
  } 
}

