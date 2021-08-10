import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_proj/src/screens/login.dart';

import '../database.dart';

final gridAssets = [
  "Assets/images/aloy.gif",
  "Assets/images/aloy-frozen.gif",
  "Assets/images/i1.jpg",
  "Assets/images/aloy-op.jpg",
  "Assets/images/i2.jpg",
  "Assets/images/i3.jpg",
  "Assets/images/i4.jpg",
  "Assets/images/i5.jpg",
  "Assets/images/i6.jpg",
  "Assets/images/i7.jpg",
  "Assets/images/i8.jpg",
  "Assets/images/i9.jpg"
];
String cId = "";

final story_data = List<String>.generate(20, (index) => "Contact ${index + 1}");

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Database db = Database();
  List docs = [];

  void initState() {
    super.initState();
    db.initialise();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white70,
        leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.camera_alt_outlined,
              color: Colors.black,
            )),
        title: Container(
          alignment: Alignment.center,
          child: Text(
            "Instagram",
            style: TextStyle(
              fontFamily: "Billabong",
              fontSize: 25,
              color: Colors.black,
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/dm');
            },
            icon: Icon(
              Icons.arrow_forward_outlined,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: Column(children: [
        Container(
          height: 110,
          child: ListView.builder(
            itemCount: story_data.length,
            padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
            itemBuilder: (content, index) {
              return Container(
                padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                height: 110,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.pinkAccent,
                      radius: 35,
                      child: CircleAvatar(
                        radius: 33.25,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          radius: 31.5,
                          backgroundImage:
                              ExactAssetImage("Assets/images/aloy-op.jpg"),
                        ),
                      ),
                    ),
                    Text(
                      story_data[index],
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              );
            },
            scrollDirection: Axis.horizontal,
          ),
        ),
        Container(
          constraints: BoxConstraints(maxHeight: 780),
          child: ListView.builder(
            cacheExtent: 1,
            shrinkWrap: true,
            itemCount: allPosts.length,
            itemBuilder: (context, index) {
              bool isLiked = false;
              var icon = Icons.favorite_border_rounded;
              var icolor = Colors.black;
              TextEditingController txt = TextEditingController();
              return Column(
                children: [
                  Container(
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.black,
                        radius: 20,
                        child: CircleAvatar(
                          radius: 19,
                          backgroundColor: Colors.white,
                          child: CircleAvatar(
                            radius: 18,
                            backgroundImage:
                                NetworkImage(allPosts[index]['dp_link']),
                          ),
                        ),
                      ),
                      title: Text(
                        allPosts[index]['username'],
                        style: TextStyle(fontSize: 12),
                      ),
                      subtitle: Text(
                        "New Delhi, India",
                        style: TextStyle(fontSize: 10),
                      ),
                      dense: true,
                    ),
                    decoration: BoxDecoration(
                        border: Border.symmetric(
                            horizontal:
                                BorderSide(width: 0.2, color: Colors.black))),
                  ),
                  Container(
                    height: 600,
                    width: double.infinity,
                    child: Image(
                      image: NetworkImage(allPosts[index]['postUrl']),
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 5, 0, 5),
                    child: Row(
                      children: [
                        Column(
                          children: [
                            IconButton(
                              icon: Icon(
                                icon,
                                size: 40,
                                color: icolor,
                              ),
                              onPressed: () {
                                final likebar = SnackBar(
                                  content: Text("You just liked that post!"),
                                );
                                if (isLiked == false) {
                                  setState(() {
                                    print("liked");
                                    icon = Icons.favorite;
                                    isLiked = true;
                                    icolor = Colors.pinkAccent;
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(likebar);
                                    db.likedBy(
                                        allPosts[index]['id'], profData['id']);
                                    db.postUpdate(cId, -1,
                                        allPosts[index]['likeCount'] + 1);
                                    // db.likedByind(
                                    //     allPosts[index]['id'],
                                    //     profData['id'],
                                    //     allPosts[index]['userId']);
                                  });
                                } else {
                                  setState(() {
                                    print("unliked");
                                    icon = Icons.favorite_border_rounded;
                                    isLiked = false;
                                    icolor = Colors.black;
                                  });
                                }
                              },
                            ),
                            Text(allPosts[index]['likeCount'].toString() +
                                " likes")
                          ],
                          crossAxisAlignment: CrossAxisAlignment.center,
                        ),
                        Container(width: 5),
                        IconButton(
                            onPressed: () {
                              cId = allPosts[index]['id'];
                            },
                            icon: Icon(
                              Icons.mode_comment_outlined,
                              size: 40,
                            )),
                        Container(
                          width: 5,
                        ),
                        IconButton(
                            onPressed: () {
                              print(allPosts[index]);
                              print(txt.text);
                            },
                            icon: Icon(
                              Icons.arrow_forward,
                              size: 40,
                            ))
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Container(
                        padding: EdgeInsets.fromLTRB(20, 20, 20, 5),
                        child: Row(
                          children: [
                            Text(
                              allPosts[index]['username'],
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Container(
                              width: 10,
                            ),
                            Expanded(
                                child: Container(
                              child: Text(allPosts[index]['caption']),
                            ))
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(15, 0, 20, 5),
                        child: TextButton(
                          child: Text(
                            "View all ${allPosts[index]['commentCount'].toString()} comments",
                            style: TextStyle(
                                color: Colors.grey.shade600,
                                fontStyle: FontStyle.italic),
                          ),
                          onPressed: () {
                            Navigator.of(context).pushNamed('/comview');
                            cId = allPosts[index]['id'];
                          },
                        ),
                      ),
                      ListTile(
                        title: TextField(
                          controller: txt,
                          decoration:
                              InputDecoration(hintText: "Write a comment..."),
                        ),
                        trailing: IconButton(
                          icon: Icon(Icons.post_add_rounded),
                          onPressed: () {
                            setState(() {
                              db.addCommentGlob(allPosts[index]['id'], txt.text,
                                  profData['id']);
                              db.postUpdate(allPosts[index]['id'],
                                  allPosts[index]['commentCount'] + 1, -1);
                              // db.addCommentInd(allPosts[index]['id'], txt.text,
                              //     profData['id'], allPosts[index]['userId']);
                            });
                          },
                        ),
                      )
                    ],
                    crossAxisAlignment: CrossAxisAlignment.start,
                  )
                ],
              );
            },
          ),
        )
      ]),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 20,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: (int) {},
        items: [
          BottomNavigationBarItem(
            icon: IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/home');
              },
              icon: Icon(Icons.home_filled),
              color: Colors.black,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/search');
              },
              icon: Icon(Icons.search_rounded),
              color: Colors.black,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/createPost');
              },
              icon: Icon(Icons.add_box_outlined),
              color: Colors.black,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/activity');
              },
              icon: Icon(Icons.favorite_border_rounded),
              color: Colors.black,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
              icon: CircleAvatar(
                backgroundColor: Colors.black,
                radius: 13,
                child: CircleAvatar(
                  radius: 12.5,
                  backgroundColor: Colors.white,
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/profile');
                    },
                    icon: CircleAvatar(
                      radius: 11,
                      backgroundImage: NetworkImage(profData['dp_link']),
                    ),
                  ),
                ),
              ),
              label: "")
        ],
      ),
    );
  }
}
