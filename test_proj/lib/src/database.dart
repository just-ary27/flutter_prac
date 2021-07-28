import 'package:cloud_firestore/cloud_firestore.dart';

class Database {
  late FirebaseFirestore firestore;
  initialise(){
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
            "followerCount":doc['followerCount'],
            "followingCount":doc['followingCount'],
            "postCount":doc['postCount'],
            "username":doc['username'],
            "email":doc['email']
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
  Future<void> create(String username,String email) async {
    try {
      await firestore.collection("users").add(
          {
            "username": username,
            "actualName": username,
            "followerCount":0,
            "followingCount":0,
            "postCount":0,
            "bio": "Hey I'm using InstaClone!",
            "email": email,
          }
      );
    } catch (e) {
      print(e);
    }
  }
  Future<void> update(String id,
      {String ActualName = "", String username = "", String bio =""}
  ) async {
    if (ActualName != "" || username != "" || bio != "") {
      try {
        await firestore
            .collection("users")
            .doc(id)
            .update({
          'actualName': ActualName,
          'username': username,
          'bio':bio,
        });
      } catch (e) {
        print(e);
      }
    }
  }
}