import 'package:bankenstein/bloc/authentication_cubit.dart';
import 'package:bankenstein/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';


class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  static const name = 'login';

  final _emailController = TextEditingController(text:'john.doe@oclock.school');
  final _passwordController = TextEditingController(text: 'password');

  void _buttonPressed() {
    debugPrint('Button pressed!');
  }


  @override
  Widget build(BuildContext context) => Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 500),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.account_balance,
                    color: Theme.of(context).primaryColor,
                    size: 48 
                  ),
                  const SizedBox(height: 8,),
                  Text('Bankenstein',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 24,
                      ),
                  ),
                  const SizedBox(height: 16,),
                  const Text('Login',
                     style: TextStyle(
                        fontSize: 20,
                      ),                  
                  ),
                  const SizedBox(height: 16,),
                  TextField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text('Email'),
                    ),
                  ),
                  const SizedBox(height: 16,),
                  TextField(
                    controller: _passwordController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text('Password'),
                    ),
                    obscureText: true,
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: _buttonPressed, 
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white, // Set overlay color to transparent
                      elevation: 0,
                    ),
                    child: Text(
                      'Forgot password',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                      ),
                    )),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      // onPressed: () {
                      //   debugPrint("Try to login with :");

                      //   context.goNamed(HomePage.name);
                      // },
                      onPressed: () async {
                          await context.read<AuthenticationCubit>().login(
                          _emailController.text.trim(),
                          _passwordController.text.trim(),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Theme.of(context).primaryColor, // Use primary color from theme
                          foregroundColor: Colors.white, // Text color
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0)
                          )
                      ),
                      child: const Text('Login'),
                    ),
                  ),
                  Row(
                    children: [
                      BlocBuilder<AuthenticationCubit, AuthenticationState>(
                        builder: (context, state) {
                          if (state is AuthenticationStateError) {
                            return const Center(
                              child: Text(
                                'Wrong email or password',
                                style: TextStyle(
                                  color: Colors.red,
                                ),
                              ),
                            );
                          }
                          return const SizedBox();
                        },
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}