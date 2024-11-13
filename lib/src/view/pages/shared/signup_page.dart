import 'package:flutter/material.dart';
import 'package:flutter_application_template/src/view/widgets/shared/form_button.dart';
import 'package:flutter_application_template/src/view/widgets/shared/input_field.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SimpleRegisterScreen extends StatefulWidget {
  /// Callback for when this form is submitted successfully. Parameters are (username, password)
  final Function(String? username, String? password)? onSubmitted;

  const SimpleRegisterScreen({this.onSubmitted, Key? key}) : super(key: key);

  @override
  State<SimpleRegisterScreen> createState() => _SimpleRegisterScreenState();
}

class _SimpleRegisterScreenState extends State<SimpleRegisterScreen> {
  late String username, password, confirmPassword;
  String? usernameError, passwordError;
  Function(String? username, String? password)? get onSubmitted =>
      widget.onSubmitted;

  @override
  void initState() {
    super.initState();
    username = '';
    password = '';
    confirmPassword = '';

    usernameError = null;
    passwordError = null;
  }

  void resetErrorText() {
    setState(() {
      usernameError = null;
      passwordError = null;
    });
  }

  bool validate() {
    resetErrorText();

    RegExp emailExp = RegExp(
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");

    bool isValid = true;
    if (username.isEmpty || !emailExp.hasMatch(username)) {
      setState(() {
        usernameError = AppLocalizations.of(context)!.usernameError;
      });
      isValid = false;
    }

    if (password.isEmpty || confirmPassword.isEmpty) {
      setState(() {
        passwordError = AppLocalizations.of(context)!.passwordError;
      });
      isValid = false;
    }
    if (password != confirmPassword) {
      setState(() {
        passwordError = AppLocalizations.of(context)!.passwordMatchError;
      });
      isValid = false;
    }

    return isValid;
  }

  void submit() {
    if (validate()) {
      if (onSubmitted != null) {
        onSubmitted!(username, password);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          children: [
            SizedBox(height: screenHeight * .12),
            Text(
              AppLocalizations.of(context)!.createAccount + ',',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: screenHeight * .01),
            Text(
              AppLocalizations.of(context)!.signupDescription + '!',
              style: TextStyle(
                fontSize: 18,
                color: Colors.black.withOpacity(.6),
              ),
            ),
            SizedBox(height: screenHeight * .12),
            InputField(
              onChanged: (value) {
                setState(() {
                  username = value;
                });
              },
              labelText: AppLocalizations.of(context)!.username,
              errorText: usernameError,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              autoFocus: true,
            ),
            SizedBox(height: screenHeight * .025),
            InputField(
              onChanged: (value) {
                setState(() {
                  password = value;
                });
              },
              labelText: AppLocalizations.of(context)!.password,
              errorText: passwordError,
              obscureText: true,
              textInputAction: TextInputAction.next,
            ),
            SizedBox(height: screenHeight * .025),
            InputField(
              onChanged: (value) {
                setState(() {
                  confirmPassword = value;
                });
              },
              onSubmitted: (value) => submit(),
              labelText: AppLocalizations.of(context)!.confirmPassword,
              errorText: passwordError,
              obscureText: true,
              textInputAction: TextInputAction.done,
            ),
            SizedBox(
              height: screenHeight * .075,
            ),
            FormButton(
              text: AppLocalizations.of(context)!.signup,
              onPressed: submit,
            ),
            SizedBox(
              height: screenHeight * .125,
            ),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: RichText(
                text: TextSpan(
                  text: AppLocalizations.of(context)!.existingUser + ', ',
                  style: TextStyle(color: Colors.black),
                  children: [
                    TextSpan(
                      text: AppLocalizations.of(context)!.login,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
