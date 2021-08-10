import 'package:flutter/material.dart';

import '../database.dart';

var userSelected;

class searchProfsScreen extends StatefulWidget {
  const searchProfsScreen({Key? key}) : super(key: key);

  @override
  _searchProfsScreenState createState() => _searchProfsScreenState();
}

class _searchProfsScreenState extends State<searchProfsScreen> {
  List tempSearchStore = [];
  List queryStore = [];
  Database db = Database();
  List FollowerList = [];

  @override
  void initState() {
    super.initState();
    db.initialise();
  }

  initiateSearch(value) {
    queryStore = [];
    if (value.length == 0) {
      setState(() {
        tempSearchStore = [];
        queryStore = [];
      });
    } else {
      db.UserSearchByName(value).then((val) {
        for (var user in val) {
          if (user['username'].toString().startsWith(value)) {
            queryStore.add(user);
          }
        }
        tempSearchStore = queryStore;
      });
    }
    print(tempSearchStore.length);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white70,
        title: TextField(
          obscureText: false,
          decoration: InputDecoration(
            fillColor: Colors.grey,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(
                width: 2.0,
                color: Colors.grey.shade700,
              ),
            ),
            contentPadding: EdgeInsets.fromLTRB(20, 0, 0, 0),
            // border
            labelText: "Search",
          ),
          onChanged: (value) {
            initiateSearch(value);
            setState(() {
              print(tempSearchStore);
            });
          },
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.backpack_outlined,
              color: Colors.black,
            ),
            onPressed: () {},
          )
        ],
      ),
      body: ListView.builder(
        itemCount: tempSearchStore.length,
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.pinkAccent,
                radius: 30,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 25,
                  child: CircleAvatar(
                    radius: 23,
                    backgroundImage:
                        NetworkImage(tempSearchStore[index]['dp_link']),
                  ),
                ),
              ),
              title: Text(tempSearchStore[index]["username"]),
              onTap: () {
                userSelected = tempSearchStore[index];
                Navigator.of(context).pushNamed('/viewProfs');
              },
            ),
          );
        },
      ),
    );
  }
}
