import 'package:flutter/material.dart';
import 'package:mvvm/utils/routes/routes_name.dart';
import 'package:mvvm/utils/utils.dart';
import 'package:mvvm/view/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
            style: TextButton.styleFrom(iconColor: Colors.blue),
            onPressed: () {
              // Utils.toastMessage("Login Sucessfully");

              Utils.flushBarErrorMessage("Error Accured!", context);

              // Utils.snackBar("Hello!!", context);

              // Navigator.pushNamed(context, RoutesName.home);

              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => const HomeScreen()));
            },
            child: const Text("Click")),
      ),
    );
  }
}
