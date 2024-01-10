// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:whistlingwoodz/models/standard_user.dart';
import 'package:whistlingwoodz/models/wedding.dart';

class FirestoreRead extends StatefulWidget {
  const FirestoreRead({super.key});

  @override
  State<FirestoreRead> createState() => _FirestoreReadState();
}

class _FirestoreReadState extends State<FirestoreRead> {
  // weddings test
  final Stream<QuerySnapshot> _weddingsStream =
      FirebaseFirestore.instance.collection('weddings').snapshots();
  // users test
  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('users').snapshots();
  String firstSixDigitsPart = "";
  String secondSixDigitsPart = "";
  String thirdSixDigitsPart = "";
  String fourSixDigitsPart = "";
  String sixDigit = "";

  // consol test
  Future readData() async {
    await FirebaseFirestore.instance
        .collection('weddings')
        // .collection('users')
        .get()
        .then((QuerySnapshot querySnapshot) {
      for (var doc in querySnapshot.docs) {
        firstSixDigitsPart =
            doc["type"].toString().toLowerCase().substring(0, 1);
        secondSixDigitsPart = doc["wid"].toString().substring(0, 2);
        thirdSixDigitsPart = doc["email"].toString().substring(0, 2);
        fourSixDigitsPart = doc["guestNo"].toString().substring(0, 1);
        sixDigit = firstSixDigitsPart +
            secondSixDigitsPart +
            thirdSixDigitsPart +
            fourSixDigitsPart;
        print(sixDigit);
        print(doc["wid"]);
        print(doc["type"]);
        print(doc["theme"]);
        print(doc["function"]);
        print(doc["venue"]);
        print(doc["guestNo"]);
        print(doc["budget"]);
        print(doc["email"]);
        print(doc["phoneNo"]);
        // print(doc["uid"]);
        // print(doc["fullName"]);
        // print(doc["email"]);
      }
    });
  }

  // void loadData(Wedding wedding) async {
  //   try {
  //     final  QuerySnapshot<Map<String, dynamic>> weddingsQuery = await FirebaseFirestore.instance
  //         .collection('weddings')
  //         .get();
  //     final weddings = weddingsQuery.docs
  //         .map((event) => Wedding.fromSnapshot(event)).toList();
  //   } catch {

  //   }
  // }

  //
  // final userfullNameRef = FirebaseFirestore.instance
  //     // .collection(FirebaseAuth.instance.currentUser!.email.toString())
  //     // .collection(FirebaseAuth.instance.currentUser!.displayName.toString())
  //     .collection('users')
  //     .withConverter(
  //         fromFirestore: (snapshot, _) =>
  //             StandardUser.fromJson(snapshot.data()!),
  //         toFirestore: (users, _) => users.toJson());

  // final weddingRef = FirebaseFirestore.instance
  //     // .collection(FirebaseAuth.instance.currentUser!.email.toString())
  //     // .collection(FirebaseAuth.instance.currentUser!.displayName.toString())
  //     .collection('weddings')
  //     .withConverter(
  //         fromFirestore: (snapshot, _) => Wedding.fromJson(snapshot.data()!),
  //         toFirestore: (weddings, _) => weddings.toJson());

  // final ref = db.collection('weddings').doc("theme").withConverter(
  //       fromFirestore: Wedding.fromJson,
  //       toFirestore: (Wedding wedding, _) => wedding.toJson(),
  //     );
  // final docSnap = await ref.get();
  // final wedding = docSnap.data(); // Convert to Wedding object
  // if (wedding != null) {
  //   print(wedding);
  // } else {
  //   print('Document does not exist on the database');
  // }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _weddingsStream,
      // stream: _weddingsStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("Loading");
        }

        readData();
        return ListView(
          shrinkWrap: true, //Without it, hasSize throws an error
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
            Map<String, dynamic> data =
                document.data()! as Map<String, dynamic>;
            return ListTile(
              title: Text(sixDigit),
              // title: Text(data['wid']),
              // subtitle: Text(data['email']),
              // title: Text(data['fullName']),
              // subtitle: Text(data['email']),
            );
          }).toList(),
        );
      },
    );

    // 첫번째 방법 test
    // Future<void> weddingsData() async {
    //   final snapshot = await weddings.get();
    //   for (var message in snapshot.docs) {
    //     print(message.data());
    //   }
    // }

    // return StreamBuilder(
    //   stream: weddingRef.orderBy('id').snapshots(),
    //   builder: (context, snapshot) {
    //     if (!snapshot.hasData) {
    //       return const Text("There is no data!");
    //     }
    //     if (snapshot.hasError) {
    //       return const Text("Failed to read the snapshot");
    //     }

    //     return Expanded(
    //       child: ListView(
    //         shrinkWrap: true, //Without it, hasSize throws an error
    //         //Turning a snapshot into a map
    //         children: snapshot.data!.docs.map((document) {
    //           weddingsData();
    //           return Column(children: [
    //             const Divider(
    //               thickness: 2,
    //             ),
    //             ListTile(
    //               title: Text("Test"
    //                   // document.data().eventTheme,
    //                   // style: const TextStyle(
    //                   //   fontSize: 20,
    //                   //   color: Colors.green,
    //                   // ),
    //                   ),
    //             ),
    //           ]); //Listtile 생성!
    //         }).toList(), //map을 list로 만들어서 반환!
    //       ),
    //     );
    //   },
    // );
  }
}
