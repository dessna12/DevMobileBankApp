import 'package:bankenstein/models/user.dart';
import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({
    super.key,
    required this.pageName,
    required this.user,
    });

  final String pageName;
  final UserModel user;
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
              Row(
                children: [
                  Text(
                    user.name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    )                    
                  ), // User's name
                  const SizedBox(width: 8), // Space between username and icon
                  const Icon(
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