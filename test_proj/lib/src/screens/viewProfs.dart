import 'package:flutter/material.dart';
import 'package:test_proj/src/screens/searchProfs.dart';

import '../database.dart';
import 'login.dart';

List followerList = [];
bool following = false;

class viewProfsScreen extends StatefulWidget {
  const viewProfsScreen({Key? key}) : super(key: key);

  @override
  _viewProfsScreenState createState() => _viewProfsScreenState();
}

class _viewProfsScreenState extends State<viewProfsScreen> {
  Database db = Database();
  List usPostData = [];
  void followCheck() {
    for (var follower in followerList) {
      if (profData['id'] == follower['id']) {
        following = true;
      }
    }
  }

  void follow() {
    setState(() {
      if (!following) {
        following = true;
        db.follow(userSelected['id'], profData['id']);
        db.update(profData['id'],
            followingCount: profData['followingCount'] + 1);
        db.update(userSelected['id'],
            followerCount: userSelected['followerCount'] + 1);
        print("done");
      }
    });
  }

  void unfollow() {
    if (following) {
      setState(() {
        following = false;
        db.unfollow(userSelected['id'], profData['id']);
        db.update(profData['id'],
            followingCount: profData['followingCount'] - 1);
        db.update(userSelected['id'],
            followerCount: userSelected['followerCount'] - 1);
        print("undone");
      });
    }
  }

  void initState() {
    following = false;
    super.initState();
    db.initialise();
    db.readIndPostlink(userSelected['id']).then((value) => {
          setState(() {
            usPostData = value;
          })
        });

    db.followerList(userSelected['id']).then((value) => followerList = value);
    followCheck();
  }

  @override
  Widget build(BuildContext context) {
    String fStat = (following) ? "Unfollow" : "Follow";
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Container(
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton.icon(
                  onPressed: () {
                    setState(() {
                      print("Reloaded!");
                    });
                  },
                  icon: Icon(
                    Icons.lock,
                    color: Colors.black,
                  ),
                  label: Text(
                    userSelected['username'],
                    style: TextStyle(color: Colors.black),
                  )),
            ],
          ),
        ),
      ),
      body: Column(children: [
        Container(
          padding: EdgeInsets.fromLTRB(30, 30, 30, 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.pinkAccent,
                    radius: 65,
                    child: CircleAvatar(
                      radius: 62.5,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: 60,
                        backgroundImage: NetworkImage(userSelected['dp_link']),
                      ),
                    ),
                  ),
                  Container(
                    width: 50,
                  ),
                  Column(
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                userSelected["postCount"].toString(),
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                ),
                              ),
                              Text(
                                "Posts",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                ),
                              )
                            ]),
                      )
                    ],
                  ),
                  Container(
                    width: 25,
                  ),
                  Column(
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                userSelected["followerCount"].toString(),
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                ),
                              ),
                              Text(
                                "Followers",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                ),
                              )
                            ]),
                      )
                    ],
                  ),
                  Container(
                    width: 25,
                  ),
                  Column(
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                userSelected["followingCount"].toString(),
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                ),
                              ),
                              Text(
                                "Following",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                ),
                              )
                            ]),
                      )
                    ],
                  ),
                ],
              ),
              Container(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      userSelected["actualName"],
                    ),
                    Text(
                      userSelected["bio"],
                    ),
                  ],
                ),
              ),
              Container(
                height: 20,
              ),
              TextButton(
                onPressed: () {
                  if (!following)
                    follow();
                  else {
                    unfollow();
                  }
                },
                child: Text(
                  fStat,
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                style: TextButton.styleFrom(
                  minimumSize: Size(double.infinity, 20),
                  side: BorderSide(color: Colors.black),
                ),
              )
            ],
          ),
        ),
        Container(
          constraints: BoxConstraints(maxHeight: 592),
          child: GridView.builder(
            cacheExtent: 9,
            shrinkWrap: true,
            itemCount: usPostData.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
            ),
            itemBuilder: (context, index) {
              return Container(
                width: 50,
                height: 50,
                child: Image(
                  fit: BoxFit.cover,
                  width: 50,
                  height: 50,
                  image: NetworkImage(usPostData[index]['postUrl'].toString()),
                ),
              );
            },
          ),
        ),
      ]),
    );
  }
}
