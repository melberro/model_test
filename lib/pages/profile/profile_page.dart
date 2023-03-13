import 'package:flutter/material.dart';
import 'package:model_test/models/user_model.dart';
import 'package:model_test/view_models/profile_view_model.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  User? get user => context.watch<ProfileViewModel>().user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Users"),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.network(user!.avatar!)),
              Text(user!.id.toString()),
              Text(user!.firstName!),
              Text(user!.lastName!),
              Text(user!.email!),
            ],
          ),
        ),
      ),
    );
  }
}
