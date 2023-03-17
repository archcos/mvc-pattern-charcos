import 'package:flutter/material.dart';
import '../controller/user_controller.dart';
import 'update_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  UserController user = UserController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("MVC View"),
      ),
      body: ListView(
        children: [
          ExpansionTile(
            leading: const Icon(Icons.account_circle_rounded),
            title: Text('NAME: ${user.user.name}'),
            subtitle: Text('AGE: ${user.user.age}'),
            children: [
              Row(
                children: [
                  const Padding(padding: EdgeInsets.all(20)),
                  Text('GENDER: ${user.user.gender}'),
                ],
              ),
              Row(
                children: [
                  const Padding(padding: EdgeInsets.all(20)),
                  Text('LOCATION: ${user.user.location}')
                ],
              )
            ],
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var update = await Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const UpdatePage())
          );
          setState(() {
            user = update;
          });
        },
        child: const Icon(Icons.update),
      ),
    );
  }
}
