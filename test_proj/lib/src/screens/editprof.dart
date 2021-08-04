import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

import 'login.dart';

import '../database.dart';

late String imageUrl = profData['dp_link'];

class EditProfScreen extends StatefulWidget {
  const EditProfScreen({Key? key}) : super(key: key);

  @override
  _EditProfScreenState createState() => _EditProfScreenState();
}

class _EditProfScreenState extends State<EditProfScreen> {
  late String _ActualName, _username, _bio;
  TextEditingController Actual =
      TextEditingController(text: profData['actualName']);
  TextEditingController User =
      TextEditingController(text: profData['username']);
  TextEditingController Bio = TextEditingController(text: profData['bio']);
  late Database db;
  List docs = [];
  initialise() {
    db = Database();
    db.initialise();
    db.read().then((value) => {
          setState(() {
            docs = value;
          })
        });
  }

  String _Email = profData['email'];
  ProfData() {
    for (var prof in docs) {
      if (_Email == prof['email']) {
        profData = prof;
      }
    }
  }

  uploadImage() async {
    final _storage = FirebaseStorage.instance;
    final _picker = ImagePicker();

    //Check Permissions
    await Permission.photos.request();

    var permissionStatus = await Permission.photos.status;

    if (permissionStatus.isGranted) {
      //Select Image
      XFile? image = await _picker.pickImage(source: ImageSource.gallery);

      if (image != null) {
        var file = File(image.path);
        //Upload to Firebase
        var snapshot = await _storage
            .ref()
            .child('users/${_Email}/pfp')
            .putFile(file)
            .whenComplete(() => null);

        var downloadUrl = await snapshot.ref.getDownloadURL();

        setState(() {
          imageUrl = downloadUrl;
          print(imageUrl);
        });
      } else {
        print('No Path Received');
      }
    } else {
      print('Grant Permissions and try again');
    }
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
        backgroundColor: Colors.white70,
        leading: IconButton(
          icon: Icon(Icons.close_rounded),
          onPressed: () {
            Navigator.of(context).pushNamed('/profile');
          },
          color: Colors.black,
        ),
        title: Text(
          "Edit Profile",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                _ActualName = Actual.text;
                _bio = Bio.text;
                _username = User.text;
              });
              db.update(profData['id'],
                  ActualName: _ActualName,
                  bio: _bio,
                  username: _username,
                  dplink: imageUrl);
              ProfData();
              Navigator.of(context).pushNamed('/profile');
            },
            icon: Icon(Icons.check_rounded),
            color: Colors.black,
          )
        ],
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 40,
            ),
            Container(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 80,
                    backgroundImage: NetworkImage(imageUrl),
                  ),
                  TextButton(
                    child: Text(
                      "Change profile photo",
                      style: TextStyle(fontSize: 20),
                    ),
                    onPressed: () => uploadImage(),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  TextField(
                    controller: Actual,
                    decoration: InputDecoration(
                      hintText: "Name",
                    ),
                  ),
                  TextField(
                    controller: User,
                    decoration: InputDecoration(
                      hintText: "Username",
                    ),
                  ),
                  TextField(
                    controller: Bio,
                    decoration: InputDecoration(
                      hintText: "Bio",
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
