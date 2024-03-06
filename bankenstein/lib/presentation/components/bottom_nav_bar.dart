import 'package:bankenstein/presentation/pages/home_page.dart';
import 'package:bankenstein/presentation/pages/recipient_page.dart';
import 'package:bankenstein/presentation/pages/settings_page.dart';
import 'package:bankenstein/presentation/pages/wallet_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MyBottomNavBar extends StatefulWidget {
  @override
  _MyBottomNavBarState createState() => _MyBottomNavBarState();
}

class _MyBottomNavBarState extends State<MyBottomNavBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Navigate to the selected page based on index
    switch (index) {
      case 0:
        context.pushNamed(HomePage.name);
        break;
      case 1:
        context.pushNamed(WalletPage.name);
        break;
      case 2:
        context.pushNamed(RecipientPage.name);
        break;
      case 3:
        // context.pushNamed(context, '/transfer');
        break;
      case 4:
        context.pushNamed(SettingsPage.name);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Theme.of(context).primaryColor,
      type: BottomNavigationBarType.fixed,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          label: '',
          icon: Icon(
            Icons.home,
            color:Colors.white
            ),
        ),
        BottomNavigationBarItem(
          label: '',
          icon: Icon(
            Icons.account_balance_wallet,
            color:Colors.white,
            ),
        ),
        BottomNavigationBarItem(
          label: '',
          icon: Icon(
            Icons.people,
            color:Colors.white),
        ),
        BottomNavigationBarItem(
          label: '',
          icon: Icon(
            Icons.swap_horiz,
            color:Colors.white),
        ),
        BottomNavigationBarItem(
          label: '',
          icon: Icon(
            Icons.settings,
            color:Colors.white),
        ),
      ],
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
    );
  }
}