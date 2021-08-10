import 'package:flutter/material.dart';

import '../database.dart';

List posts = [];
List Commenters = [];
List Users = [];

class commentViewScreen extends StatefulWidget {
  const commentViewScreen({Key? key}) : super(key: key);

  @override
  _commentViewScreenState createState() => _commentViewScreenState();
}

class _commentViewScreenState extends State<commentViewScreen> {
  Database db = Database();
  List docs = [];

  void initState() {
    super.initState();
    db.initialise();
    for (var snap in Commenters) {
      Users.add(snap.docs[0]);
    }
    print(Users);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_rounded,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context).pushNamed('/home');
            Users = [];
          },
        ),
        title: Text(
          "Comments",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: ListView.builder(
          itemCount: posts.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(Users[index]['dp_link']),
              ),
              title: Row(
                children: [
                  Text(Users[index]['username']),
                  Container(
                    width: 20,
                  ),
                  Expanded(child: Text(posts[index]['comment']))
                ],
              ),
              subtitle: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TextButton(
                    child: Text("Like"),
                    onPressed: () {},
                  ),
                ],
              ),
            );
          }),
    );
  }
}
