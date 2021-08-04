import 'package:cloud_firestore/cloud_firestore.dart';

class Database {
  late FirebaseFirestore firestore;

  initialise() {
    firestore = FirebaseFirestore.instance;
  }

  Future<List> read() async {
    QuerySnapshot querySnapshot;
    List docs = [];
    try {
      querySnapshot = await firestore.collection('users').get();
      if (querySnapshot.docs.isNotEmpty) {
        for (var doc in querySnapshot.docs.toList()) {
          Map data = {
            "id": doc.id,
            "actualName": doc['actualName'],
            "bio": doc["bio"],
            "followerCount": doc['followerCount'],
            "followingCount": doc['followingCount'],
            "postCount": doc['postCount'],
            "username": doc['username'],
            "email": doc['email'],
            "dp_link": doc['dp_link'],
          };
          docs.add(data);
        }
        return docs;
      }
    } catch (e) {
      print(e);
    }
    return docs;
  }

  Future <List> readIndPostlink(String id) async {
    QuerySnapshot querySnapshot;
    List docs = [];
    try {
      querySnapshot = await firestore.collection('users/${id}/posts').get();
      if (querySnapshot.docs.isNotEmpty) {
        for (var doc in querySnapshot.docs.toList()) {
          Map data = {
            "id": doc.id,
            'likeCount' : doc['likeCount'],
            'commentCount' : doc['commentCount'],
            'caption':doc['caption'],
            'postUrl': doc['postUrl'],
          };
          docs.add(data);
        }
        return docs;
      }
    } catch (e) {
      print(e);
    }
    return docs;
  }
  Future <List>  postDataProvider() async {
    QuerySnapshot querySnapshot;
    List docs = [];
    try{
      querySnapshot = await firestore.collection('posts').get();
      if (querySnapshot.docs.isNotEmpty){
        for (var doc in querySnapshot.docs.toList()){
          Map data = {
            "caption": doc['caption'],
            "likeCount": doc['likeCount'],
            "commentCount": doc['commentCount'],
            "username": doc['username'],
            "postUrl": doc['postUrl'],
            "dp_link" : doc['dp_link'],
          };
          docs.add(data);
        }
        return docs;
      }
    } catch (e) {
      print(e);
    }
    return docs;
  }
  Future<void> create(String username, String email, String dp) async {
    try {
      await firestore.collection("users").add({
        "username": username,
        "actualName": username,
        "followerCount": 0,
        "followingCount": 0,
        "postCount": 0,
        "bio": "Hey I'm using InstaClone!",
        "email": email,
        "dp_link": dp
      });
    } catch (e) {
      print(e);
    }
  }

  Future<void> createPost(String username, String caption, String userId,
      String postUrl, postNo, String dp_link) async {
    try {
      await firestore.collection('posts').add({
        "username": username,
        "caption": caption,
        "likeCount": 0,
        "commentCount": 0,
        "userId": userId,
        "postUrl": postUrl,
        "dp_link" : dp_link,
      });
      await firestore.collection('users/${userId}/posts').add({
        "username": username,
        "caption": caption,
        "likeCount": 0,
        "commentCount": 0,
        "userId": userId,
        "postUrl": postUrl,
        "postNo": postNo,
      }).then((_) {
        print("collection created");
      }).catchError((_) {
        print("an error occured");
      });
    } catch (e) {
      print(e);
    }
  }

  Future<void> update(String id,
      {
        String ActualName = "",
        String username = "",
        String bio = "",
        int postCount = 0,
        int followerCount = 0,
        int followingCount = 0,
        dplink,
      }) async {
    if (ActualName != "" || username != "" || bio != "") {
      try {
        await firestore.collection("users").doc(id).update({
          'actualName': ActualName,
          'username': username,
          'bio': bio,
          'dp_link': dplink,
        });
      } catch (e) {
        print(e);
      }
    }
    if (postCount !=0) {
      print("postcount updated");
      try{
      await firestore.collection("users").doc(id).update({
        'postCount': postCount,
      });
      }catch (e){
        print(e);
      }
    }
    if (followerCount !=0) {
      await firestore.collection("users").doc(id).update({
        'followerCount': followerCount,
      });
    }
    if (followingCount !=0) {
      await firestore.collection("users").doc(id).update({
        'followingCount': followingCount,
      });
    }
  }
}