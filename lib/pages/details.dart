import 'package:flutter/material.dart';

import '../models/user.dart';

class Details extends StatelessWidget {
  final User? user;

  const Details({super.key, this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User details", style: TextStyle(color: Colors.white)),
        leading: BackButton(color: Colors.white),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: Container(
        margin: EdgeInsets.fromLTRB(10, 20, 10, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              spacing: 10,
              //mainAxisAlignment: MainAxisAlignment.center,
              children: [CircleAvatar(child: Text(user!.name![0])),
                    Text( user!.name.toString()),
                    Text( user!.email.toString()),
                    Text( user!.phone.toString()),
                    Text( user!.website.toString()),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
