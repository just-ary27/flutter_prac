import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

import '../database.dart';
import 'login.dart';

class CreatePostsScreen extends StatefulWidget {
  const CreatePostsScreen({Key? key}) : super(key: key);

  @override
  _CreatePostsScreenState createState() => _CreatePostsScreenState();
}

class _CreatePostsScreenState extends State<CreatePostsScreen> {
  TextEditingController _captionController = TextEditingController();
  late String _caption;
  String postUrl = '';

  final FirebaseAuth loginInstance = FirebaseAuth.instance;

  final FirebaseAuth signUpInstance = FirebaseAuth.instance;

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

  ProfData() {
    for (var prox in docs) {
      if (profData['email'] == prox['email']) {
        profData = prox;
      }
    }
  }

  uploadPostImage() async {
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
            .child('posts/${profData['id']}/${profData['postCount']}')
            .putFile(file)
            .whenComplete(() => null);

        var downloadUrl = await snapshot.ref.getDownloadURL();

        setState(() {
          postUrl = downloadUrl;
          print(postUrl);
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
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, '/profile');
          },
          icon: Icon(
            Icons.arrow_back_rounded,
            color: Colors.black,
          ),
        ),
        title: Text(
          "New Post",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                _caption = _captionController.text;
                ProfData();
                db.update(profData['id'], postCount: profData['postCount'] + 1);
                db.createPost(profData['username'], _caption, profData['id'],
                    postUrl, profData['postCount'] + 1, profData['dp_link']);

                Navigator.pushNamed(context, '/profile');
                setState(() {
                  postUrl =
                      "https://firebasestorage.googleapis.com/v0/b/instacloneproj.appspot.com/o/globals%2Fdefault_avatar.jpg?alt=media&token=6ce0405e-2bb3-492a-aec6-75866a0775d1";
                  ProfData();
                });
              },
              icon: Icon(
                Icons.check_rounded,
                color: Colors.black,
              )),
        ],
        backgroundColor: Colors.white70,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Container(
              height: 50,
            ),
            ListTile(
              leading: IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/profile');
                },
                icon: CircleAvatar(
                  radius: 15,
                  backgroundImage: NetworkImage(profData['dp_link']),
                ),
              ),
              title: TextField(
                controller: _captionController,
                decoration: InputDecoration(
                  hintText: "Write a caption...",
                ),
              ),
              trailing: Container(
                  height: 50,
                  width: 50,
                  child: Image(
                    image: (postUrl == '')
                        ? NetworkImage(
                            "https://firebasestorage.googleapis.com/v0/b/instacloneproj.appspot.com/o/globals%2Fdefault_avatar.jpg?alt=media&token=6ce0405e-2bb3-492a-aec6-75866a0775d1")
                        : NetworkImage(postUrl),
                  )),
            ),
            Row(
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      uploadPostImage();
                    },
                    child: Text(
                      "Upload Image",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.blueAccent),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
