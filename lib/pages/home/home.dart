import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:model_test/models/user_model.dart';
import 'package:model_test/pages/profile/profile_page.dart';
import 'package:model_test/view_models/profile_view_model.dart';
import 'package:provider/provider.dart';

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
      context.read<ProfileViewModel>().getUsers();
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
              child: Stack(
                children: [
                  ListView.builder(
                      itemCount: context.watch<ProfileViewModel>().users.length,
                      itemBuilder: (context, index) {
                        User user =
                            context.watch<ProfileViewModel>().users[index];
                        return GestureDetector(
                            onTap: () async {
                              await context
                                  .read<ProfileViewModel>()
                                  .getUser(user.id!);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ProfilePage()));
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                children: [
                                  ClipRRect(
                                      borderRadius: BorderRadius.circular(100),
                                      child: Image.network(
                                        user!.avatar!,
                                        width: 80,
                                        height: 80,
                                      )),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(user.firstName! + " " + user.lastName!),
                                ],
                              ),
                            ));
                      }),
                  if (context.watch<ProfileViewModel>().loading)
                    Center(child: CircularProgressIndicator())
                ],
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
                          ),
                        ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
