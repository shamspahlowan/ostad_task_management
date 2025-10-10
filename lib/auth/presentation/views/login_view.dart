import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ostad_task_management/auth/presentation/views/pswd_reset_email_verify_view.dart';
import 'package:ostad_task_management/auth/presentation/views/signup_view.dart';
import 'package:ostad_task_management/auth/presentation/widgets/background.dart';
import 'package:ostad_task_management/dashboard/presentation/dashboard_view.dart';
import 'package:ostad_task_management/util/asset_paths.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();

  void _navigateToPswdResetEmailView() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return PswdResetEmailVerifyView();
        },
      ),
    );
  }

  void _navigateDashboardView() {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) {
          return DashboardView();
        },
      ),
      (predicate) {
        return false;
      },
    );
  }

  TapGestureRecognizer? _navigateToSignupView() {
    return TapGestureRecognizer()
      ..onTap = () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return SignupView();
            },
          ),
        );
      };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Background(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(48.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Get Started With",
                          style: GoogleFonts.jetBrainsMono(
                            fontWeight: FontWeight.w900,
                            fontSize: 30,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      SizedBox(height: 15),
                      TextFormField(
                        decoration: InputDecoration(hintText: "Email"),
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(hintText: "Password"),
                      ),
                      SizedBox(height: 10),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: _navigateDashboardView,
                          child: SvgPicture.asset(
                            AssetPaths.buttonIcon,
                            colorFilter: ColorFilter.mode(
                              Colors.white,
                              BlendMode.srcIn,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 50),
                InkWell(
                  onTap: _navigateToPswdResetEmailView,
                  child: Text(
                    "Forgot password?",
                    style: GoogleFonts.montserrat(color: Colors.grey),
                  ),
                ),
                SizedBox(height: 20),
                RichText(
                  text: TextSpan(
                    text: "Don't have an account? ",
                    style: GoogleFonts.montserrat(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    children: [
                      TextSpan(
                        text: "Signup",
                        style: GoogleFonts.montserrat(color: Colors.green),
                        recognizer: _navigateToSignupView(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
