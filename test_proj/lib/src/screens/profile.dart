import 'package:flutter/material.dart';

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
                  onPressed: () {},
                  icon: Icon(
                    Icons.lock,
                    color: Colors.black,
                  ),
                  label: Text(
                    "JustAry27",
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
                        ExactAssetImage("Assets/images/aloy-op.jpg"),
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
                                "27",
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
                                "270",
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
                                "300",
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
                    Text("Aryan Ranjan"),
                    Text("Digital goodies designer @pixsellz"),
                    Text("Learning Flutter"),
                  ],
                ),
              ),
              Container(
                height: 20,
              ),
              TextButton(
                onPressed: () {},
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
            itemCount: gridAssets.length,
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
                  image: AssetImage(gridAssets[index]),
                ),
              );
            },
          ),
        ),
      ]),
      bottomNavigationBar: BottomNavigationBar(
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
            icon: Icon(
              Icons.add_box_outlined,
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
                      ExactAssetImage("Assets/images/aloy-op.jpg"),
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
