import 'package:flutter/material.dart';
import 'package:mvvm/res/colors.dart';
import 'package:mvvm/res/components/round_button.dart';
import 'package:mvvm/utils/utils.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final ValueNotifier<bool> _obsecurePassword = ValueNotifier<bool>(true);

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    _emailController.dispose();
    _passwordController.dispose();

    emailFocusNode.dispose();
    passwordFocusNode.dispose();

    _obsecurePassword.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 1;
    return Scaffold(
        appBar: AppBar(
          title: const Text("Login"),
          centerTitle: true,
          backgroundColor: AppColors.blueColor,
          titleTextStyle: const TextStyle(
            color: AppColors.whiteColor,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  focusNode: emailFocusNode,
                  onFieldSubmitted: (value) {
                    Utils.fieldFocusChange(
                        context, emailFocusNode, passwordFocusNode);
                  },
                  validator: Utils.validateEmail,
                  decoration: const InputDecoration(
                    hintText: "Enter Your Email",
                    labelText: "Email",
                    prefixIcon: Icon(Icons.email),
                  ),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                ValueListenableBuilder(
                    valueListenable: _obsecurePassword,
                    builder: (context, value, child) {
                      return TextFormField(
                        controller: _passwordController,
                        obscureText: _obsecurePassword.value,
                        obscuringCharacter: "*",
                        focusNode: passwordFocusNode,
                        decoration: InputDecoration(
                          hintText: "Enter Your Password",
                          labelText: "Password",
                          prefixIcon: const Icon(Icons.lock_open_outlined),
                          suffixIcon: InkWell(
                              onTap: () {
                                _obsecurePassword.value =
                                    !_obsecurePassword.value;
                              },
                              child: Icon(
                                _obsecurePassword.value
                                    ? Icons.visibility_off_outlined
                                    : Icons.visibility,
                              )),
                        ),
                      );
                    }),
                SizedBox(
                  height: height * .05,
                ),
                RoundButton(
                  title: 'Login',
                  onPressed: () {
                    String? emailError =
                        Utils.validateEmail!(_emailController.text);
                    if (emailError != null) {
                      Utils.flushBarErrorMessage(emailError, context);
                    } else if (_passwordController.text.isEmpty) {
                      Utils.flushBarErrorMessage(
                          "Please Enter a Password", context);
                    } else if (_passwordController.text.length < 6) {
                      Utils.flushBarErrorMessage(
                          "Paswword should be at least 6 digits", context);
                    } else {
                      print("API Hits");
                    }
                  },
                ),
              ],
            ),
          ),
        ));
  }
}
