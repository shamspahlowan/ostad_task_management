import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ostad_task_management/auth/contorller/auth_controller.dart';
import 'package:ostad_task_management/auth/presentation/views/login_view.dart';
import 'package:ostad_task_management/auth/presentation/widgets/background.dart';
import 'package:ostad_task_management/dashboard/presentation/dashboard_view.dart';
import 'package:ostad_task_management/util/asset_paths.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    _moveToLoginView();
  }

  Future _moveToLoginView() async {
    await Future.delayed(Duration(seconds: 3));

    final bool isLoggedIn = await AuthController.isUserAlreadyLoggedIn();
    if (isLoggedIn) {
      await AuthController.getUserData();
      
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) {
            return DashboardView();
          },
        ),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) {
            return LoginView();
          },
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Background(
        child: Center(
          child: SvgPicture.asset(AssetPaths.logo, fit: BoxFit.none),
        ),
      ),
    );
  }
}
