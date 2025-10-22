import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ostad_task_management/auth/presentation/widgets/background.dart';
import 'package:ostad_task_management/auth/presentation/widgets/signin_prompt_footer.dart';
import 'package:ostad_task_management/shared/api_caller.dart';
import 'package:ostad_task_management/shared/show_snackbar_message.dart';
import 'package:ostad_task_management/util/asset_paths.dart';
import 'package:ostad_task_management/util/urls.dart';
import 'package:ostad_task_management/util/validator.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  late final TextEditingController _emailController;
  late final TextEditingController _pswdController;
  late final TextEditingController _confPswdController;
  late final TextEditingController _firstNameController;
  late final TextEditingController _lastNameController;
  late final TextEditingController _phoneController;
  final _formKey = GlobalKey<FormState>();
  bool _signUpInProgress = false;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _pswdController = TextEditingController();
    _confPswdController = TextEditingController();
    _firstNameController = TextEditingController();
    _lastNameController = TextEditingController();
    _phoneController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _pswdController.dispose();
    _confPswdController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

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
                  key: _formKey,
                  autovalidateMode: AutovalidateMode.onUnfocus,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(hintText: "Email"),
                        validator: (value) => Validator.email(value),
                      ),
                      SizedBox(height: 5),
                      TextFormField(
                        controller: _firstNameController,
                        decoration: InputDecoration(hintText: "First Name"),
                        validator: (value) => Validator.requiredField(value),
                      ),
                      SizedBox(height: 5),
                      TextFormField(
                        controller: _lastNameController,
                        decoration: InputDecoration(hintText: "Last Name"),
                        validator: (value) => Validator.requiredField(value),
                      ),
                      SizedBox(height: 5),
                      TextFormField(
                        controller: _phoneController,
                        decoration: InputDecoration(hintText: "Mobile"),
                        validator: (value) => Validator.phone(value),
                      ),
                      SizedBox(height: 5),
                      TextFormField(
                        controller: _pswdController,
                        decoration: InputDecoration(hintText: "Password"),
                        validator: (value) =>
                            Validator.password(value, minLength: 6),
                      ),
                      SizedBox(height: 15),
                      SizedBox(
                        width: double.infinity,
                        height: 38,
                        child: Visibility(
                          visible: _signUpInProgress == false,
                          replacement: Center(
                            child: CircularProgressIndicator(),
                          ),
                          child: ElevatedButton(
                            onPressed: _onSubmitButton,
                            child: SvgPicture.asset(
                              AssetPaths.buttonIcon,
                              colorFilter: ColorFilter.mode(
                                Colors.white,
                                BlendMode.srcIn,
                              ),
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

  void _onSubmitButton() {
    if (_formKey.currentState!.validate()) {
      _signUp();
    }
  }

  void _clearTextFields() {
    _emailController.clear();
    _pswdController.clear();
    _confPswdController.clear();
    _firstNameController.clear();
    _lastNameController.clear();
    _phoneController.clear();
  }

  Future<void> _signUp() async {
    _signUpInProgress = true;
    setState(() {});
    Map<String, dynamic> json = {
      "email": _emailController.text.trim(),
      "firstName": _firstNameController.text.trim(),
      "lastName": _lastNameController.text.trim(),
      "mobile": _phoneController.text.trim(),
      "password": _pswdController.text,
    };

    final ApiResponse response = await ApiCaller.postRequest(
      url: Urls.registerUrl,
      body: json,
    );

    if (response.isSccuess) {
      _clearTextFields();
      ShowSnackbarMessage.showSnackBarMessage(
        context,
        "Registration done! login to procced!",
      );
    } else {
      ShowSnackbarMessage.showSnackBarMessage(context, response.error!);
    }

    setState(() {
      _signUpInProgress = false;
    });
  }
}
