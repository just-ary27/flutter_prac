import 'package:flutter/material.dart';

import 'login.dart';

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

class ActivityScreen extends StatefulWidget {
  const ActivityScreen({Key? key}) : super(key: key);

  @override
  _ActivityScreenState createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          children: [TextButton(onPressed: () {}, child: Text("Following"))],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              leading: Text("Follow requests"),
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border(
                top: BorderSide(color: Colors.grey, width: 1.0),
                bottom: BorderSide(color: Colors.grey, width: 1.0),
              )),
              child: Column(
                children: [
                  ListTile(
                    leading: Text("New"),
                  ),
                  ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.black,
                      radius: 15,
                      child: CircleAvatar(
                        radius: 14,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          radius: 13,
                          backgroundImage:
                              ExactAssetImage("Assets/images/aloy-op.jpg"),
                        ),
                      ),
                    ),
                    title: Text("JustAry27 liked your photo. 3h"),
                    trailing: Container(
                      height: 45,
                      width: 40,
                      child: Image(
                        image: AssetImage("Assets/images/aloy.gif"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border(
                bottom: BorderSide(color: Colors.grey, width: 1.0),
              )),
              child: Column(
                children: [
                  ListTile(
                    leading: Text("Today"),
                  ),
                  ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.black,
                      radius: 15,
                      child: CircleAvatar(
                        radius: 14,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          radius: 13,
                          backgroundImage:
                              ExactAssetImage("Assets/images/aloy-op.jpg"),
                        ),
                      ),
                    ),
                    title: Text(
                        "JustAry27, Aryan and 25 others liked your photo. 10d"),
                    trailing: Container(
                      height: 45,
                      width: 40,
                      child: Image(
                        image: AssetImage("Assets/images/aloy.gif"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border(
                bottom: BorderSide(color: Colors.grey, width: 1.0),
              )),
              child: Column(
                children: [
                  ListTile(
                    leading: Text("This Week"),
                  ),
                  ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.black,
                      radius: 15,
                      child: CircleAvatar(
                        radius: 14,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          radius: 13,
                          backgroundImage:
                              ExactAssetImage("Assets/images/aloy-op.jpg"),
                        ),
                      ),
                    ),
                    title: Text("JustAry27 mentioned you in a comment:\n"
                        "@justary27 Beautiful pic! . 3d"),
                    subtitle: Row(
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.favorite_border_rounded)),
                        TextButton(onPressed: () {}, child: Text("Reply")),
                      ],
                    ),
                    trailing: Container(
                      height: 45,
                      width: 40,
                      child: Image(
                        image: AssetImage("Assets/images/aloy.gif"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.black,
                      radius: 15,
                      child: CircleAvatar(
                        radius: 14,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          radius: 13,
                          backgroundImage:
                              ExactAssetImage("Assets/images/aloy-op.jpg"),
                        ),
                      ),
                    ),
                    title: Text("JustAry27 started following you. 4d"),
                    trailing: TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.white,
                          side: BorderSide(color: Colors.grey, width: 1.0)),
                      child: Text(
                        "Message",
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.black,
                      radius: 15,
                      child: CircleAvatar(
                        radius: 14,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          radius: 13,
                          backgroundImage:
                              ExactAssetImage("Assets/images/aloy-op.jpg"),
                        ),
                      ),
                    ),
                    title: Text("JustAry27 started following you. 4d"),
                    trailing: TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.white,
                          side: BorderSide(color: Colors.grey, width: 1.0)),
                      child: Text(
                        "Message",
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.black,
                      radius: 15,
                      child: CircleAvatar(
                        radius: 14,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          radius: 13,
                          backgroundImage:
                              ExactAssetImage("Assets/images/aloy-frozen.gif"),
                        ),
                      ),
                    ),
                    title: Text("Aryan started following you. 6d"),
                    trailing: Container(
                      child: TextButton(
                        style: TextButton.styleFrom(
                            backgroundColor: Colors.blueAccent),
                        onPressed: () {},
                        child: Text(
                          "Follow",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                ListTile(
                  leading: Text("This Month"),
                ),
                ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.black,
                    radius: 15,
                    child: CircleAvatar(
                      radius: 14,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: 13,
                        backgroundImage:
                            ExactAssetImage("Assets/images/aloy-op.jpg"),
                      ),
                    ),
                  ),
                  title: Text("JustAry27 liked your photo. 3h"),
                  trailing: Container(
                    height: 45,
                    width: 40,
                    child: Image(
                      image: AssetImage("Assets/images/aloy.gif"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.black,
                    radius: 15,
                    child: CircleAvatar(
                      radius: 14,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: 13,
                        backgroundImage:
                            ExactAssetImage("Assets/images/aloy-op.jpg"),
                      ),
                    ),
                  ),
                  title: Text("JustAry27 liked your photo. 15d"),
                  trailing: Container(
                    height: 45,
                    width: 40,
                    child: Image(
                      image: AssetImage("Assets/images/aloy.gif"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.black,
                    radius: 15,
                    child: CircleAvatar(
                      radius: 14,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: 13,
                        backgroundImage:
                            ExactAssetImage("Assets/images/aloy-op.jpg"),
                      ),
                    ),
                  ),
                  title: Text("JustAry27 liked your photo. 20d"),
                  trailing: Container(
                    height: 45,
                    width: 40,
                    child: Image(
                      image: AssetImage("Assets/images/aloy.gif"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.black,
                    radius: 15,
                    child: CircleAvatar(
                      radius: 14,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: 13,
                        backgroundImage:
                            ExactAssetImage("Assets/images/aloy-op.jpg"),
                      ),
                    ),
                  ),
                  title: Text("JustAry27 liked your photo. 25d"),
                  trailing: Container(
                    height: 45,
                    width: 40,
                    child: Image(
                      image: AssetImage("Assets/images/aloy.gif"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.black,
                    radius: 15,
                    child: CircleAvatar(
                      radius: 14,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: 13,
                        backgroundImage:
                            ExactAssetImage("Assets/images/aloy-op.jpg"),
                      ),
                    ),
                  ),
                  title: Text("JustAry27 liked your photo. 27d"),
                  trailing: Container(
                    height: 45,
                    width: 40,
                    child: Image(
                      image: AssetImage("Assets/images/aloy.gif"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
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
    );  }
}
