import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

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
final search_data = [
  'IGTV',
  'Shop',
  'Space',
  '&|_OY',
  'Horizon Zero Dawn',
  'Shepherd',
  'Sports',
  'Flutter',
  'Table Tennis',
  'Reels',
  '3 Men in a boat'
];

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white70,
        title: TextField(
          onTap: () {
            Navigator.of(context).pushNamed('/searchProfs');
          },
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
      body: Container(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: Container(
                height: 50,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: search_data.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          search_data[index],
                          style: TextStyle(color: Colors.black),
                        ),
                        style: TextButton.styleFrom(
                            backgroundColor: Colors.white,
                            side: BorderSide(width: 1.0, color: Colors.black)),
                      ),
                    );
                  },
                ),
              ),
            ),
            Container(
              constraints: BoxConstraints(maxHeight: 820),
              child: StaggeredGridView.countBuilder(
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  itemCount: gridAssets.length,
                  itemBuilder: (content, index) {
                    return Column(
                      children: [
                        Image(
                          image: AssetImage(gridAssets[index]),
                          fit: BoxFit.cover,
                        ),
                      ],
                    );
                  },
                  staggeredTileBuilder: (index) => StaggeredTile.fit(1)),
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
