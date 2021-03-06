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

  Future<List> readIndPostlink(String id) async {
    QuerySnapshot querySnapshot;
    List docs = [];
    try {
      querySnapshot = await firestore.collection('users/${id}/posts').get();
      if (querySnapshot.docs.isNotEmpty) {
        for (var doc in querySnapshot.docs.toList()) {
          Map data = {
            "id": doc.id,
            'likeCount': doc['likeCount'],
            'commentCount': doc['commentCount'],
            'caption': doc['caption'],
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

  Future<List> postDataProvider() async {
    QuerySnapshot querySnapshot;
    List docs = [];
    try {
      querySnapshot = await firestore.collection('posts').get();
      if (querySnapshot.docs.isNotEmpty) {
        for (var doc in querySnapshot.docs.toList()) {
          Map data = {
            "id": doc.id,
            "caption": doc['caption'],
            "likeCount": doc['likeCount'],
            "commentCount": doc['commentCount'],
            "username": doc['username'],
            "postUrl": doc['postUrl'],
            "dp_link": doc['dp_link'],
            "userId": doc['userId'],
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

  Future<void> follow(String userid, String followerId) async {
    try {
      await firestore.collection("users/${userid}/followers").add({
        "userid": userid,
      });
      print("followed");
    } catch (e) {
      print(e);
    }
  }

  Future<List> followerList(String userid) async {
    List docs = [];
    try {
      QuerySnapshot querySnapshot =
          await firestore.collection("users/${userid}/followers").get();
      if (querySnapshot.docs.isNotEmpty) {
        for (var doc in querySnapshot.docs.toList()) {
          docs.add(doc);
        }
        return docs;
      }
    } catch (e) {
      print(e);
    }
    return docs;
  }

  Future<void> unfollow(String userid, String unfollowerId) async {
    try {
      var doc = await firestore
          .collection('users/${userid}/followers')
          .where('userid', isEqualTo: unfollowerId)
          .get();
      var docx = doc.docs.toList();
      var reqDocId = docx[0].id;
      await firestore
          .collection('users/${userid}/followers')
          .doc(reqDocId)
          .delete();
      print("Unfollowed");
    } catch (e) {
      print(e);
    }
  }

  Future<void> following(String userid) async {
    try {
      await firestore.collection("users/${userid}/following").add({
        "userid": userid,
      });
    } catch (e) {
      print(e);
    }
  }

  Future<List> followingList(String userid) async {
    List docs = [];
    try {
      QuerySnapshot querySnapshot =
          await firestore.collection("users/${userid}/following").get();
      if (querySnapshot.docs.isNotEmpty) {
        for (var doc in querySnapshot.docs.toList()) {
          docs.add(doc);
        }
        return docs;
      }
    } catch (e) {
      print(e);
    }
    return docs;
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
        "dp_link": dp_link,
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

  Future<void> update(
    String id, {
    String ActualName = "",
    String username = "",
    String bio = "",
    int postCount = -1,
    int followerCount = -1,
    int followingCount = -1,
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
    if (postCount != -1) {
      print("postcount updated");
      try {
        await firestore.collection("users").doc(id).update({
          'postCount': postCount,
        });
      } catch (e) {
        print(e);
      }
    }
    if (followerCount != -1) {
      await firestore.collection("users").doc(id).update({
        'followerCount': followerCount,
      });
    }
    if (followingCount != 0) {
      await firestore.collection("users").doc(id).update({
        'followingCount': followingCount,
      });
    }
  }

  Future<void> addCommentGlob(
      String postId, String comment, String userid) async {
    try {
      await firestore.collection('posts/${postId}/comments').add({
        "comment": comment,
        "userid": userid,
        "likeCount": 0,
      });
    } catch (e) {
      print(e);
    }
  }

  Future<void> addCommentInd(
      String postId, String comment, String userid, String authorId) async {
    try {
      await firestore
          .collection('users/${authorId}/posts/${postId}/likedby')
          .add({
        "authorId": authorId,
        "comment": comment,
        "userid": userid,
        "likeCount": 0,
      });
    } catch (e) {
      print(e);
    }
  }

  Future<void> likedBy(String postId, String userid) async {
    try {
      await firestore.collection('posts/${postId}/likedby').add({
        "userid": userid,
      });
    } catch (e) {
      print(e);
    }
  }

  Future<void> likedByind(String postId, String userid, String authorId) async {
    try {
      await firestore
          .collection('users/${authorId}/posts/${postId}/likedby')
          .add({
        "authorId": authorId,
        "userid": userid,
      });
    } catch (e) {
      print(e);
    }
  }

  Future<List> readlikedby(String postId) async {
    QuerySnapshot querySnapshot;
    List docs = [];
    try {
      querySnapshot =
          await firestore.collection('posts/${postId}/likedby').get();
      if (querySnapshot.docs.isNotEmpty) {
        for (var doc in querySnapshot.docs.toList()) {
          Map data = {"id": doc.id, "userid": doc['userid']};
          docs.add(data);
        }
        return docs;
      }
    } catch (e) {
      print(e);
    }
    return docs;
  }

  Future<List> readComments(String postId) async {
    QuerySnapshot querySnapshot;
    List docs = [];
    try {
      querySnapshot =
          await firestore.collection('posts/${postId}/comments').get();
      if (querySnapshot.docs.isNotEmpty) {
        for (var doc in querySnapshot.docs.toList()) {
          Map data = {
            "id": doc.id,
            "userid": doc['userid'],
            "comment": doc['comment'],
            "likeCount": doc['likeCount'],
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

  Future<List> readlikedbyInd(String postId, String authorId) async {
    QuerySnapshot querySnapshot;
    List docs = [];
    try {
      querySnapshot = await firestore
          .collection('users/${authorId}/posts/${postId}/likedby')
          .get();
      if (querySnapshot.docs.isNotEmpty) {
        for (var doc in querySnapshot.docs.toList()) {
          Map data = {"id": doc.id, "userid": doc['userid']};
          docs.add(data);
        }
        return docs;
      }
    } catch (e) {
      print(e);
    }
    return docs;
  }

  Future<void> postUpdate(
    String postid, [
    int cCount = -1,
    int lCount = -1,
  ]) async {
    try {
      if (lCount != -1) {
        await firestore.collection("posts").doc(postid).update({
          'likeCount': lCount,
        });
        print('done');
      }
      if (cCount != -1) {
        await firestore.collection("posts").doc(postid).update({
          'commentCount': cCount,
        });
        print('done');
      }
    } catch (e) {
      print(e);
    }
    ;
  }

  Future<List> PostSearch(String postId) async {
    QuerySnapshot querySnapshot = await firestore
        .collection('posts')
        .where(FieldPath.documentId, isEqualTo: postId)
        .get();
    List a = [];
    a = querySnapshot.docs.toList();
    return a;
  }

  Future<QuerySnapshot> UserSearch(String userId) async {
    QuerySnapshot querySnapshot = await firestore
        .collection('users')
        .where(FieldPath.documentId, isEqualTo: userId)
        .get();
    return querySnapshot;
  }

  Future<List> UserSearchByName(String username) async {
    List docs = [];
    try {
      QuerySnapshot querySnapshot = await firestore
          .collection('users')
          .where('username', isGreaterThanOrEqualTo: username)
          .get();
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
      }
      return docs;
    } catch (e) {
      print(e);
    }
    return docs;
  }
}
