import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ostad_task_management/auth/presentation/views/pswd_reset_pin_veriy_view.dart';
import 'package:ostad_task_management/auth/presentation/widgets/background.dart';
import 'package:ostad_task_management/auth/presentation/widgets/signin_prompt_footer.dart';
import 'package:ostad_task_management/util/asset_paths.dart';

class PswdResetEmailVerifyView extends StatefulWidget {
  const PswdResetEmailVerifyView({super.key});

  @override
  State<PswdResetEmailVerifyView> createState() =>
      _PswdResetEmailVerifyViewState();
}

class _PswdResetEmailVerifyViewState extends State<PswdResetEmailVerifyView> {
  void _navigateToPinVerifyView() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return PswdResetPinVeriyView();
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
            padding: const EdgeInsets.all(48.0),
            child: Column(
              children: [
                Text(
                  "Your Email Address",
                  style: GoogleFonts.jetBrainsMono(
                    fontWeight: FontWeight.w900,
                    fontSize: 28,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  "A 6-digit verification pin will be sent to your email address",
                  style: GoogleFonts.montserrat(color: Colors.grey),
                ),
                SizedBox(height: 20),
                Form(
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(hintText: "Email"),
                      ),
                      SizedBox(height: 10),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: _navigateToPinVerifyView,
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
                SizedBox(height: 10),
                SigninPromptFooter(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
