import 'package:flutter/material.dart';
import 'package:model_test/pages/profile/profile_page.dart';
import 'package:model_test/view_models/profile_view_model.dart';
import 'package:provider/provider.dart';

import '../../models/user_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context
          .read<ProfileViewModel>()
          .getUsers(); // tüm users map listesi getirilir.
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Users")),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: context
                    .watch<ProfileViewModel>()
                    .users
                    .length, // tüm listenin uzunluğu
                itemBuilder: (context, index) {
                  User user = context
                      .watch<ProfileViewModel>()
                      .users[index]; // tüm listenin belli elemanı
                  return GestureDetector(
                    onTap: () async {
                      await context.read<ProfileViewModel>().getUser(
                          user.id!); // belli elemanın özelliklerini al usera at
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProfilePage(),
                          ));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Image.network(
                                user.avatar!,
                                width: 80,
                                height: 80,
                              )),
                          Text(user.firstName! + " " + user.lastName!),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 1;
                    i <= context.watch<ProfileViewModel>().totalPage;
                    i++)
                  context.watch<ProfileViewModel>().page == i
                      ? Text(i.toString())
                      : TextButton(
                          onPressed: () {
                            context.read<ProfileViewModel>().setPage(i);
                          },
                          child: Text(
                            i.toString(),
                          )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
