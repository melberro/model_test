import 'package:flutter/material.dart';
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
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: context.watch<LoginViewModel>().usernameController,
              decoration: InputDecoration(
                  labelText: "Email",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  prefixIcon: Icon(Icons.email),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(color: myPrimaryColor))),
            ),
            SizedBox(height: 20),
            TextField(
              controller: context.watch<LoginViewModel>().passwordController,
              decoration: InputDecoration(
                  labelText: "Password",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  prefixIcon: Icon(Icons.lock),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(color: myPrimaryColor))),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.7,
              height: 45,
              child: ElevatedButton(
                onPressed: () async {
                  bool result = await context.read<LoginViewModel>().login();
                  if (result) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomePage()));

                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text("Giriş Yapıldı")));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Giriş Yapılamadı")));
                  }
                },
                child: Text("Login"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

const Color myPrimaryColor = Color.fromRGBO(2, 137, 123, 1);
