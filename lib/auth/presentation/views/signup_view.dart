import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ostad_task_management/auth/presentation/widgets/background.dart';
import 'package:ostad_task_management/auth/presentation/widgets/signin_prompt_footer.dart';
import 'package:ostad_task_management/util/asset_paths.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Background(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(48.0),
            child: Column(
              children: [
                Text(
                  "Join with us",
                  style: GoogleFonts.jetBrainsMono(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Form(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextFormField(
                        decoration: InputDecoration(hintText: "Email"),
                      ),
                      SizedBox(height: 5),
                      TextFormField(
                        decoration: InputDecoration(hintText: "First Name"),
                      ),
                      SizedBox(height: 5),
                      TextFormField(
                        decoration: InputDecoration(hintText: "Last Name"),
                      ),
                      SizedBox(height: 5),
                      TextFormField(
                        decoration: InputDecoration(hintText: "Mobile"),
                      ),
                      SizedBox(height: 5),
                      TextFormField(
                        decoration: InputDecoration(hintText: "Password"),
                      ),
                      SizedBox(height: 15),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {},
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
