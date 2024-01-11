// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:whistlingwoodz/models/dashboard.dart';
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
  // corporates test
  final Stream<QuerySnapshot> _corporatesStream =
      FirebaseFirestore.instance.collection('corporates').snapshots();
  // users test
  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('users').snapshots();
  // surveys test
  final Stream<QuerySnapshot> _surveysStream =
      FirebaseFirestore.instance.collection('surveys').snapshots();

  String firstSixDigitsPart = "";
  String secondSixDigitsPart = "";
  String thirdSixDigitsPart = "";
  String fourSixDigitsPart = "";
  String sixDigit = "";

  // consol test
  Future readData() async {
    fetchData();
  }

  Future<void> fetchData() async {
    QuerySnapshot<Map<String, dynamic>> collection = await FirebaseFirestore
        .instance
        .collection("surveys")
        .orderBy('timeStamp', descending: true)
        .get();

    // Now you can access the documents from the collection
    List<QueryDocumentSnapshot<Map<String, dynamic>>> documents =
        collection.docs;

    if (documents.isNotEmpty) {
      // Accessing the latest data from the document.
      Map<String, dynamic> data = documents.first.data();
      // Print data from the first document
      print("Data from the first document: $data");
      print("Documents count: ${documents.length}");
      // firstSixDigitsPart =
      //     data["type"].toString().toLowerCase().substring(0, 1);
      // secondSixDigitsPart = data["guestNo"].toString().substring(0, 2);
      // print(firstSixDigitsPart);
      // print(secondSixDigitsPart);
      print(data["id"].toString());
      print(data["message"].toString());

      // firstSixDigitsPart =
      //         data["type"].toString().toLowerCase().substring(0, 1);
      //     secondSixDigitsPart = data["wid"].toString().substring(0, 2);
      //     thirdSixDigitsPart = data["email"].toString().substring(0, 2);
      //     fourSixDigitsPart = data["guestNo"].toString().substring(0, 1);
      //     sixDigit = firstSixDigitsPart +
      //         secondSixDigitsPart +
      //         thirdSixDigitsPart +
      //         fourSixDigitsPart;
      //     print(data["wid"]);
      //     print(data["type"]);
      //     print(data["theme"]);
      //     print(data["function"]);
      //     print(data["venue"]);
      //     print(data["guestNo"]);
      //     print(data["budget"]);
      //     print(data["email"]);
      //     print(data["phoneNo"]);
      //     print(sixDigit);
    }

    // await FirebaseFirestore.instance
    //     .collection('weddings')
    //     // .collection('users')
    //     .get()
    //     .then((QuerySnapshot querySnapshot) {
    //   for (var doc in querySnapshot.docs) {
    //     firstSixDigitsPart =
    //         doc["type"].toString().toLowerCase().substring(0, 1);
    //     secondSixDigitsPart = doc["wid"].toString().substring(0, 2);
    //     thirdSixDigitsPart = doc["email"].toString().substring(0, 2);
    //     fourSixDigitsPart = doc["guestNo"].toString().substring(0, 1);
    //     sixDigit = firstSixDigitsPart +
    //         secondSixDigitsPart +
    //         thirdSixDigitsPart +
    //         fourSixDigitsPart;
    //     print(sixDigit);
    //     print(doc["wid"]);
    //     print(doc["type"]);
    //     print(doc["theme"]);
    //     print(doc["function"]);
    //     print(doc["venue"]);
    //     print(doc["guestNo"]);
    //     print(doc["budget"]);
    //     print(doc["email"]);
    //     print(doc["phoneNo"]);

    // print(doc["uid"]);
    // print(doc["fullName"]);
    // print(doc["email"]);
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

  final List<DashboardScreen> services = [
    DashboardScreen(
      title: "12",
      subtitle: "Users",
    ),
    DashboardScreen(
      title: "23",
      subtitle: "Weddings",
    ),
    DashboardScreen(
      title: "5",
      subtitle: "Corporates",
    ),
    DashboardScreen(
      title: "6",
      subtitle: "Parties",
    ),
    DashboardScreen(
      title: "7",
      subtitle: "Inquiries",
    ),
    DashboardScreen(
      title: "9",
      subtitle: "Surveys",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _corporatesStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("Loading");
        }

        readData();
        return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 2.0,
            mainAxisSpacing: 10.0,
            childAspectRatio: 1.3,
          ),
          itemCount: services.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                // show the details of the respective event
              },
              child: Card(
                elevation: 5,
                color: Colors.grey[100],
                shadowColor: Colors.grey[900],
                margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: Text(
                        services[index].title,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            height: 4,
                            fontSize: 26.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 40),
                      child: Text(
                        services[index].subtitle,
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 20.0),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
        // return ListView(
        //   shrinkWrap: true, //Without it, hasSize throws an error
        //   children: snapshot.data!.docs.map((DocumentSnapshot document) {
        //     Map<String, dynamic> data =
        //         document.data()! as Map<String, dynamic>;
        //     return ListTile(
        //       title: Text(data['theme']),
        //       // subtitle: Text(secondSixDigitsPart),
        //       // title: Text(data['fullName']),
        //       // subtitle: Text(data['email']),
        //     );
        //   }).toList(),
        // );
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
