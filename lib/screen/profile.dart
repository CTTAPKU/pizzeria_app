import 'package:flutter/material.dart';
import '../widgets/cascading_menu.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pizzeria_aic/Services/user_data.dart';

class profile extends StatefulWidget {
  const profile({super.key});

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {

  final uid = FirebaseAuth.instance.currentUser!.uid;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.edit),
          onPressed: () {

          },
        ),
        title: const Text("Профіль"),
        centerTitle: true,
        actions: [cascading_menu()],
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 12, bottom: 15),
            child: const CircleAvatar(
              radius: 83,
              child: Text("avatar"),
            ),
          ),
          FutureBuilder(future: UserData().getUserByUId(uid),
              builder: (context, snapshot) {

                    if(snapshot.hasData){
                    Map<String, dynamic>? data = snapshot.data as Map<String, dynamic>;
                    return Text("Ім'я: ${data['firstName']}  ${data['lastName']}");}
                    else return Text("loading...");

              }),
          Container(
            margin: EdgeInsets.only(top: 10, bottom: 10),
            child: Divider(),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 10),
            child: Text("Ваші бонуси"),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("Доступні"),
              Text("Всього"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("0"),
              Text("0"),
            ],
          )
        ],
      ),
    );
  }
}
