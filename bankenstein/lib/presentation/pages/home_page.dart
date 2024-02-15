import 'package:bankenstein/presentation/components/bottom_nav_bar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static const name = 'home';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isDarkMode = false;

  void _toggleDarkMode() {
    setState(() {
      _isDarkMode = !_isDarkMode;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Row(
            children: [
              Text(
                'Home',
                style: TextStyle(
                  color: Colors.white
                )
              ), 
              Spacer(), 
              Row(
                children: [
                  Text(
                    'Alexis Vanderpitte',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    )                    
                  ), // User's name
                  SizedBox(width: 8), // Space between username and icon
                  Icon(
                    Icons.account_circle,
                    color: Colors.white
                    ), // Account icon
                ],
              ),
            ],
          ),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                Text('Welcome Alexis Vandepitte',
                  style: TextStyle(
                    fontSize: 25),
                ),
                SizedBox(height: 8,),
                Text('Use the navigation bar to go to your accounts or to transfer money',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15)
                )
            ]),
        ),
      ),
      bottomNavigationBar: MyBottomNavBar(),
      );
  }
}