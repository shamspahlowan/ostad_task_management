import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ostad_task_management/auth/presentation/views/login_view.dart';
import 'package:ostad_task_management/auth/presentation/widgets/background.dart';

class SetNewPswdView extends StatefulWidget {
  const SetNewPswdView({super.key});

  @override
  State<SetNewPswdView> createState() => _SetNewPswdViewState();
}

class _SetNewPswdViewState extends State<SetNewPswdView> {
  bool pswdVisibility = false;
  bool confPswdVisibility = false;

  void _navigateToLoginView() {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) {
          return LoginView();
        },
      ),
      (route) {
        return false;
      },
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
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Set New Password",
                    style: GoogleFonts.jetBrainsMono(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Minimum password lenght 8 characters\nUse combination of numbers and letters",
                    style: GoogleFonts.jetBrainsMono(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Form(
                  child: Column(
                    children: [
                      TextFormField(
                        obscureText: !pswdVisibility,
                        decoration: InputDecoration(
                          hintText: "Password",
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                pswdVisibility = !pswdVisibility;
                              });
                            },
                            icon: pswdVisibility
                                ? Icon(Icons.visibility_outlined)
                                : Icon(Icons.visibility_off_outlined),
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      SizedBox(height: 5),
                      TextFormField(
                        obscureText: !confPswdVisibility,
                        decoration: InputDecoration(
                          hintText: "Confirm password",
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                confPswdVisibility = !confPswdVisibility;
                              });
                            },
                            icon: confPswdVisibility
                                ? Icon(Icons.visibility_outlined)
                                : Icon(Icons.visibility_off_outlined),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: _navigateToLoginView,
                          child: Text("Confirm"),
                        ),
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
