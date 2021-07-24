import 'package:flutter/material.dart';

final data = List<String>.generate(26, (index) => "Contact ${index + 1}");
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

class DMScreen extends StatefulWidget {
  const DMScreen({Key? key}) : super(key: key);

  @override
  _DMScreenState createState() => _DMScreenState();
}

class _DMScreenState extends State<DMScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pushNamed('/home');
          },
          icon: Icon(Icons.arrow_back_ios_new_rounded),
          color: Colors.black,
        ),
        title: Container(
          alignment: Alignment.center,
          child: TextButton.icon(
            onPressed: () {},
            icon: Icon(
              Icons.keyboard_arrow_down_rounded,
              color: Colors.black,
            ),
            label: Text(
              "JustAry27",
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.add_rounded),
            color: Colors.black,
          )
        ],
        backgroundColor: Colors.white,
      ),
      body: Container(
          child: Column(children: [
            Container(
              height: 70,
              padding: EdgeInsets.fromLTRB(10, 10, 10, 15),
              child: TextField(
                decoration: InputDecoration(
                  // icon: Icon(Icons.search),
                    labelText: "Search",
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey.shade700,
                      ),
                      borderRadius: BorderRadius.circular(15),
                    )),
              ),
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.pinkAccent,
                radius: 30,
                child: CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    radius: 23,
                    backgroundImage: AssetImage("Assets/images/aloy-op.jpg"),
                  ),
                ),
              ),
              title: Text("JustAry27"),
              subtitle: Text("Hello! How are you?"),
              trailing: Icon(
                Icons.camera_alt_outlined,
                size: 35,
              ),
            ),
            Container(
              constraints: BoxConstraints(maxHeight: 760),
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: data.length,
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
                              AssetImage("Assets/images/aloy-op.jpg"),
                            ),
                          ),
                        ),
                        title: Text("${data[index]}"),
                        subtitle: Row(
                          children: [
                            Expanded(child: Text("Hello! How are you?")),
                            Text(
                              ". 27m",
                            )
                          ],
                        ),
                        trailing: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.camera_alt_outlined,
                            size: 35,
                          ),
                        ),
                      ),
                    );
                  }),
            )
          ])),
      bottomNavigationBar: BottomAppBar(
        child: TextButton.icon(
            icon: Icon(Icons.camera_alt),
            onPressed: () {},
            label: Text("Camera")),
      ),
    );
  }
}
