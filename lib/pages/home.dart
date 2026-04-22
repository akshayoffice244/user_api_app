import 'package:flutter/material.dart';
import 'package:user_api/pages/details.dart';
import 'package:user_api/service/user_service.dart';

import '../models/user.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  UserService userService = UserService();
  late Future<List<User>> userFuture;

  @override
  void initState() {
    super.initState();
    userFuture = userService.fetchUsers("users");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User List", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.deepOrangeAccent,
      ),

      body: Column(
        children: [
          FutureBuilder(
            future: userFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else if (!snapshot.hasData) {
                return Text('No data');
              }
              final users = snapshot.data!;

              return Expanded(
                child: ListView.builder(
                  itemCount: users.length,
                  itemBuilder: (context, index) {
                    return Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(12),
                      ),
                      child: ListTile(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (builder)=>Details(user: users[index],)));
                        },
                        leading: CircleAvatar(
                          child: Text(users[index].name![0]),
                        ),
                        title: Text(users[index].name ?? ''),
                        subtitle: Text(users[index].email ?? ''),
                        trailing: Icon(
                          Icons.arrow_forward_ios_outlined,
                          size: 15,
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepOrangeAccent,
        child: Icon(Icons.refresh, color: Colors.white,),
        onPressed: () {
          userFuture = userService.fetchUsers("users");
          setState(() {});
        },
      ),
    );
  }
}
