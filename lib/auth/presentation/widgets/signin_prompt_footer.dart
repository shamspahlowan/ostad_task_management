import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ostad_task_management/auth/presentation/views/signin_view.dart';

class SigninPromptFooter extends StatefulWidget {
  const SigninPromptFooter({super.key});

  @override
  State<SigninPromptFooter> createState() => _SigninPromptFooterState();
}

class _SigninPromptFooterState extends State<SigninPromptFooter> {
  late final TapGestureRecognizer _tapRecognizer;

  @override
  void initState() {
    super.initState();
    _tapRecognizer = TapGestureRecognizer()..onTap = _navigateToSigninView;
  }

  @override
  void dispose() {
    _tapRecognizer.dispose();
    super.dispose();
  }

  void _navigateToSigninView() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return SigninView();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: "Have an account? ",
        style: GoogleFonts.montserrat(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
        children: [
          TextSpan(
            text: "Signin",
            style: GoogleFonts.montserrat(color: Colors.green),
            recognizer: _tapRecognizer,
          ),
        ],
      ),
    );
  }
}
