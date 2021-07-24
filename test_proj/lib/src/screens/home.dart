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

final story_data = List<String>.generate(20, (index) => "Contact ${index + 1}");

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
            itemCount: gridAssets.length,
            itemBuilder: (context, index) {
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
                            ExactAssetImage("Assets/images/aloy-op.jpg"),
                          ),
                        ),
                      ),
                      title: Text(
                        "JustAry27",
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
                    height: 650,
                    width: double.infinity,
                    child: Image(
                      image: AssetImage(gridAssets[index]),
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 5, 0, 5),
                    child: Row(
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.favorite_border_rounded,
                            size: 40,
                          ),
                          onPressed: () {
                            final likebar = SnackBar(
                              content: Text("You just liked that post!"),
                            );
                            ScaffoldMessenger.of(context).showSnackBar(likebar);
                          },
                        ),
                        Container(width: 5),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.mode_comment_outlined,
                              size: 40,
                            )),
                        Container(
                          width: 5,
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.arrow_forward,
                              size: 40,
                            ))
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        child: Text(
                          "JustAry27",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                      ),
                      Expanded(
                          child: Container(
                            child: Text("Great pic! 🔥🔥"),
                          ))
                    ],
                  )
                ],
              );
            },
          ),
        )
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
