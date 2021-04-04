import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';

class DatabaseService {
  final String uid;
  FirebaseAuth auth;
  DatabaseService({this.uid}) {
    auth = FirebaseAuth.instance;
  }

  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users');

  getCR() async {
    DocumentSnapshot doc =
        await FirebaseFirestore.instance.collection('users').doc('uid1').get();
    print(doc.data());
  }
  // Stream<UserData> getUserDataStream() async* {
  //   await for (var firebaseUser in auth.authStateChanges()) {
  //     if (firebaseUser != null) {
  //       final id = firebaseUser.uid;
  //       final ref = userCollection.doc(id);
  //       yield* ref.snapshots().map(
  //         (snap) {
  //           if (snap.exists) {
  //             return UserData(doc: snap.data(), id: snap.id);
  //           } else {
  //             return UserData.empty();
  //           }
  //         },
  //       );
  //     } else {
  //       yield UserData.empty();
  //     }
  //   }
  // }

  Future<bool> isUserDocExists() async {
    User user = auth.currentUser;
    DocumentSnapshot userDoc = await userCollection.doc(user.uid).get();
    print(user.uid);
    if (userDoc.exists) {
      print("true");
      return true;
    }
    return false;
  }

  Future<void> createNewDocument({@required String name}) async {
    User user = auth.currentUser;
    await userCollection.doc(user.uid).set({
      'name': name,
      'createdAt': DateFormat.yMMMd().format(DateTime.now()),
      'phoneNumber': user.phoneNumber ?? "",
    });
  }
}
