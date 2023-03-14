import 'package:flutter/material.dart';
import 'package:model_test/view_models/login_view_model.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text("Giriş Yap"),
        TextField(
          controller: context.watch<LoginViewModel>().usernameController,
          decoration: InputDecoration(labelText: "Email"),
        ),
        TextField(
          controller: context.watch<LoginViewModel>().passwordController,
          decoration: InputDecoration(labelText: "Password"),
        ),
        ElevatedButton(
          onPressed: () {
            context.read<LoginViewModel>().login();
          },
          child: const Text(
            "Login",
            style: TextStyle(fontSize: 20),
          ),
        ),
      ]),
    );
  }
}
