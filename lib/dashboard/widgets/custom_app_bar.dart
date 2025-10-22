import 'package:flutter/material.dart';
import 'package:ostad_task_management/auth/contorller/auth_controller.dart';
import 'package:ostad_task_management/auth/presentation/views/login_view.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _CustomAppBarState extends State<CustomAppBar> {
  void _navigateLoginView() async {
    await AuthController.clearUserData();
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) {
          return LoginView();
        },
      ),
      (predicate) {
        return false;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 1,
      backgroundColor: const Color(0xFF21BF73),
      title: Row(
        spacing: 10,
        children: [
          CircleAvatar(radius: 23, child: Icon(Icons.person)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "shams".toUpperCase(),
                style: Theme.of(
                  context,
                ).textTheme.titleMedium?.copyWith(color: Colors.white),
              ),
              Text(
                "data",
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium?.copyWith(color: Colors.white),
              ),
            ],
          ),
        ],
      ),
      actions: [
        IconButton(onPressed: _navigateLoginView, icon: Icon(Icons.logout)),
      ],
    );
  }
}
