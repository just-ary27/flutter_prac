import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'login.dart';
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


class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  final FirebaseAuth logOutInstance = FirebaseAuth.instance;
  late Database db;
  List docs=[];

  initialise() {
    db = Database();
    db.initialise();
    db.read().then((value) => {
      setState(() {
        docs = value;
      })
    });
    db.readIndPostlink(profData['id']).then((value) => {
      setState(() {
        indiPostData = value;
      })
    });
    db.postDataProvider().then((value) => {
      setState(() {
        allPosts = value;
      })
    });
}

  @override
  void initState() {
    super.initState();
    initialise();
  }

  @override
  Widget build(BuildContext context) {
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
                    profData['username'],
                    style: TextStyle(color: Colors.black),
                  )),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.keyboard_arrow_down_rounded),
                color: Colors.black,
              )
            ],
          ),
        ),
        actions: [
          IconButton(
            color: Colors.black,
              onPressed: (){
                try{
                  logOutInstance.signOut();
                  Navigator.of(context).pushNamed('/login');
                  profData = {};
                  indiPostData = [];
                } catch(e){
                  print(e);
                }
              },
              icon: Icon(Icons.power_settings_new_rounded),
          ),
        ],
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
                        backgroundImage:
                        NetworkImage(profData['dp_link']),
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
                                profData["postCount"].toString(),
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
                                profData["followerCount"].toString(),
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
                                profData["followingCount"].toString(),
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
                    Text(profData["actualName"],),
                    Text(
                      profData["bio"],
                    ),
                  ],
                ),
              ),
              Container(
                height: 20,
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/editprof');
                  print(docs);
                },
                child: Text(
                  "Edit Profile",
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
            itemCount: indiPostData.length,
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
                  image: NetworkImage(indiPostData[index]['postUrl'].toString()),
                ),
              );
            },
          ),
        ),
      ]),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 20,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: (int) {},
        items: [
          BottomNavigationBarItem(
            icon: IconButton(
              onPressed: (){
                Navigator.of(context).pushNamed('/home');
              },
              icon:Icon(Icons.home_filled),
              color: Colors.black,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: IconButton(
              onPressed: (){
                Navigator.of(context).pushNamed('/search');
              },
              icon: Icon(Icons.search_rounded),
              color: Colors.black,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: IconButton(
              onPressed: (){
                Navigator.of(context).pushNamed('/createPost');
              },
              icon: Icon(Icons.add_box_outlined),
              color: Colors.black,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: IconButton(
              onPressed: (){
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
                    onPressed: (){
                      Navigator.of(context).pushNamed('/profile');
                    },
                    icon: CircleAvatar(
                      radius: 11,
                      backgroundImage:
                      NetworkImage(profData['dp_link']),
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
