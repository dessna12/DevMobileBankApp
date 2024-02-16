import 'package:bankenstein/presentation/components/app_bar.dart';
import 'package:bankenstein/presentation/components/bottom_nav_bar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static const name = 'Home';

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
      appBar: const MyAppBar(pageName: HomePage.name,),
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