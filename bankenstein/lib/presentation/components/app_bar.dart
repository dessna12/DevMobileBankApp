import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({
    super.key,
    required this.pageName 
    });

  final String pageName;

  @override
  Widget build(BuildContext context) {
    return AppBar(
          title: Row(
            children: [
              Text(
                pageName,
                style: const TextStyle(
                  color: Colors.white
                )
              ), 
              const Spacer(), 
              const Row(
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
      );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}