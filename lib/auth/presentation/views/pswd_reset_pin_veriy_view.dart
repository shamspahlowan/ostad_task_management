import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ostad_task_management/auth/presentation/views/set_new_pswd_view.dart';
import 'package:ostad_task_management/auth/presentation/widgets/background.dart';
import 'package:ostad_task_management/auth/presentation/widgets/otp_input_field.dart';
import 'package:ostad_task_management/auth/presentation/widgets/signin_prompt_footer.dart';

class PswdResetPinVeriyView extends StatefulWidget {
  const PswdResetPinVeriyView({super.key});

  @override
  State<PswdResetPinVeriyView> createState() => _PswdResetPinVeriyViewState();
}

class _PswdResetPinVeriyViewState extends State<PswdResetPinVeriyView> {
  void _navigateToSetNewPswdView() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return SetNewPswdView();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Background(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsetsGeometry.all(48),
            child: Column(
              children: [
                Text(
                  "Pin Verificaton",
                  style: GoogleFonts.jetBrainsMono(
                    fontSize: 34,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "A 6-digit pin was sent to your email address",
                  style: GoogleFonts.montserrat(color: Colors.grey),
                ),
                SizedBox(height: 10),
                OtpInputField(),
                SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _navigateToSetNewPswdView,
                    child: Text("Verify"),
                  ),
                ),
                SizedBox(height: 20),
                SigninPromptFooter(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
