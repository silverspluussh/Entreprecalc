import 'package:finmate/constants/colors.dart';
import 'package:finmate/view/mobversion.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../realm/app_services.dart';

class Introduction extends StatefulWidget {
  const Introduction({super.key});

  @override
  State<Introduction> createState() => _IntroductionState();
}

class _IntroductionState extends State<Introduction> {
  late TextEditingController _email;
  late TextEditingController _password;
  bool _isLogin = true;
  String? _errorMessage;

  @override
  void initState() {
    _email = TextEditingController()..addListener(clearError);
    _password = TextEditingController()..addListener(clearError);
    super.initState();
  }

  void clearError() {
    if (_errorMessage != null) {
      setState(() {
        // Reset error message when user starts typing
        _errorMessage = null;
      });
    }
  }

  void _logInOrSignUpUser(
      BuildContext context, String email, String password) async {
    final appServices = Provider.of<AppServices>(context, listen: false);
    clearError();
    try {
      if (_isLogin) {
        await appServices.logInUserEmailPassword(email, password);
      } else {
        await appServices.registerUserEmailPassword(email, password);
      }
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const Render()));
    } catch (err) {
      setState(() {
        _errorMessage = err.toString();
      });
    }
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldColor,
      body: SafeArea(
          child: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 100),
          children: [
            const Text(
              'Account Authentication',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontFamily: 'IranSans',
                  color: AppColors.primaryColor,
                  fontSize: 18),
            ),
            const SizedBox(height: 40),
            Form(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Email'),
                  const SizedBox(height: 20),
                  TextFormField(
                      controller: _email,
                      validator: (val) {
                        if (val!.isEmpty) {
                          return 'field cannot be empty';
                        }
                        if (!val.contains('@') && !val.contains('.com')) {
                          return 'email format is wrong';
                        }
                      },
                      style: const TextStyle(fontSize: 17),
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(20),
                          border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 1, color: AppColors.primaryColor),
                              borderRadius: BorderRadius.circular(15)),
                          hintText: 'email address')),
                  const SizedBox(height: 40),
                  const Text('Password'),
                  const SizedBox(height: 20),
                  TextFormField(
                      controller: _password,
                      validator: (val) {
                        if (val!.isEmpty) {
                          return 'field cannot be empty';
                        }
                        if (val.length < 8) {
                          return 'password is too short';
                        }
                      },
                      style: const TextStyle(fontSize: 17),
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(20),
                          border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 1, color: AppColors.primaryColor),
                              borderRadius: BorderRadius.circular(15)),
                          hintText: 'password')),
                  const SizedBox(height: 30),
                  Container(
                    height: 50,
                    width: 350,
                    margin: const EdgeInsets.symmetric(vertical: 25),
                    child: ElevatedButton(
                      style: ButtonStyle(
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                          textStyle: MaterialStateProperty.all<TextStyle>(
                              const TextStyle(
                                  color: Colors.white, fontSize: 20)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(20.0)))),
                      onPressed: () => _logInOrSignUpUser(
                        context,
                        _email.text,
                        _password.text,
                      ),
                      child: Text(_isLogin ? 'Log in' : 'Sign up'),
                    ),
                  ),
                  TextButton(
                      onPressed: () => setState(() => _isLogin = !_isLogin),
                      child: Text(
                        _isLogin
                            ? "Create a new account"
                            : 'Sign in into your account.',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            color: Colors.blue,
                            fontFamily: 'IranSans',
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      )),
                  Padding(
                    padding: const EdgeInsets.all(25),
                    child: Text(_errorMessage ?? "",
                        style: errorTextStyle(context),
                        textAlign: TextAlign.center),
                  ),
                ],
              ),
            ))
          ],
        ),
      )),
    );
  }

  errorTextStyle(BuildContext context, {bool bold = false}) {
    final theme = Theme.of(context);
    return TextStyle(
        color: theme.colorScheme.error,
        fontWeight: bold ? FontWeight.bold : FontWeight.normal);
  }
}
