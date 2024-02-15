import 'package:bankenstein/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  static const name = 'login';

  final _emailController = TextEditingController(text:'student@oclock.io');
  final _passwordController = TextEditingController(text: 'password@student');

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
                      onPressed: () {
                        context.goNamed(HomePage.name);
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