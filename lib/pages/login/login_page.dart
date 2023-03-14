import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:model_test/pages/home/home.dart';
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: context
                .watch<LoginViewModel>()
                .usernameController,
            decoration: InputDecoration(labelText: "Email"),
          ),
          TextField(
            controller: context
                .watch<LoginViewModel>()
                .passwordController,
            decoration:
                InputDecoration(labelText: "Password"),
          ),
          ElevatedButton(
            onPressed: () async {
              bool result = await context
                  .read<LoginViewModel>()
                  .login();
              if (result) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => HomePage()));

                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                        content: Text("Giriş Yapıldı")));
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                        content: Text("Giriş Yapılamadı")));
              }
            },
            child: Text("login"),
          ),
        ],
      ),
    );
  }
}
