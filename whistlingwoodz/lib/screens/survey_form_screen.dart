import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:whistlingwoodz/main.dart';
import 'package:whistlingwoodz/models/survey.dart';
import 'package:uuid/uuid.dart';

class SurveyForm extends StatefulWidget {
  const SurveyForm({super.key, required this.data});
  final bool data;

  @override
  State<SurveyForm> createState() => _SurveyFormState();
}

class _SurveyFormState extends State<SurveyForm> {
  final messageController = TextEditingController();

  final Stream<QuerySnapshot> _weddingsStream =
      FirebaseFirestore.instance.collection('weddings').snapshots();

  String firstSixDigitsPart = "";
  String secondSixDigitsPart = "";
  String thirdSixDigitsPart = "";
  String fourSixDigitsPart = "";
  String sixDigit = "";

  Future readData() async {
    

    fetchData();
   
  // _firestore
  //    .collection("wedding")
  //    .orderBy('createdAt', descending: true).get();
  //   // QuerySnapshot<Map<String, dynamic>> data 
  //   //     await FirebaseFirestore.instance.collection('weddings').get();
  //   collection =  _firestore
  //    .collection("wedding")
  //    .orderBy('timeStamp', descending: true).get() as Map<String, dynamic>;

    // firstSixDigitsPart =
    //     collection["type"].toString().toLowerCase().substring(0, 1);
    // secondSixDigitsPart =
    //     collection["wid"].toString().toLowerCase().substring(0, 2);
    // thirdSixDigitsPart = collection["email"].toString().substring(0, 2);
    // fourSixDigitsPart = collection["guestNo"].toString().substring(0, 1);
    // sixDigit = firstSixDigitsPart +
    //     secondSixDigitsPart +
    //     thirdSixDigitsPart +
    //     fourSixDigitsPart;

    
    // print(collection["wid"]);
    // print(collection["type"]);
    // print(collection["theme"]);
    // print(collection["function"]);
    // print(collection["venue"]);
    // print(collection["guestNo"]);
    // print(collection["budget"]);
    // print(collection["email"]);
    // print(collection["phoneNo"]);
    // print(sixDigit);
 
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
    //     print(doc["uid"]);
    //     print(doc["fullName"]);
    //     print(doc["email"]);
    //   }
    // });

    // FirebaseFirestore.instance
    //     .collection('weddings')
    //     .get()
    //     .then((QuerySnapshot querySnapshot) {
    //   querySnapshot.docs.forEach((doc) {
    //     print(doc["wid"]);
    //   });
    // });
  }



Future<void> fetchData() async {
  try {
    QuerySnapshot<Map<String, dynamic>> collection = await FirebaseFirestore.instance
        .collection("weddings")
        .orderBy('timeStamp', descending: true)
        .get();
    
    // Now you can access the documents from the collection
    List<QueryDocumentSnapshot<Map<String, dynamic>>> documents = collection.docs;
  
     if (documents.isNotEmpty) {
    // Accessing the latest data from the document.
    Map<String, dynamic> data = documents.first.data();
    
    // Print data from the first document
    print("Data from the first document: $data");
  } else {
    print("No documents found in the collection.");
  }
  } catch (e) {
    print("Error fetching data: $e");
  }
}


  @override
  void dispose() {
    messageController.dispose();
    super.dispose();
  }

  // function to navigate to previous screen where they were
  Future back() async {
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }

  homeFunction() {
    runApp(MaterialApp(
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      title: 'Whistlingwoodz',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      // ignore: prefer_const_constructors
      home: MyApp(selectedIndex: 7),
    ));
  }

  generateId() {
    const uuid = Uuid();
    return uuid.v4();
  }

  Future submit() async {
    late final survey = Survey(
      id: generateId().toString(),
      message: messageController.text.trim(),
    );
    addInquiryDetails(survey);
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }

  Future addInquiryDetails(Survey survey) async {
    await FirebaseFirestore.instance.collection('surveys').add(survey.toJson());
  }

  @override
  Widget build(BuildContext context) {
    readData();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        // backgound photo for landing page
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/surveyForm.jpg"),
            opacity: 0.8,
            fit: BoxFit.cover,
          ),
        ),

        child: Padding(
          padding: const EdgeInsets.fromLTRB(30, 30, 30, 0),
          child: SingleChildScrollView(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.6,
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                color: Colors.white54,
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Column(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        // tab title
                        const Padding(
                          padding: EdgeInsets.fromLTRB(20, 0, 15, 0),
                          child: Text(
                            'To finalise, Please Complete a Quick Survey.',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2,
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // inquiry text form field
                                  _buildSurvey(),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  // submit button
                                  _buildSubmit(),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // inquiry text form field
  Widget _buildSurvey() => TextFormField(
        controller: messageController,
        autofocus: false,
        maxLines: 15,
        keyboardType: TextInputType.multiline,
        decoration: const InputDecoration(
          hintText: "Please tell us how you felt while using our app*",
          alignLabelWithHint: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
        ),
      );

  //the submit button
  Widget _buildSubmit() => SizedBox(
        width: double.infinity,
        child: OutlinedButton(
          style: TextButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 20),
            foregroundColor: Colors.yellowAccent,
            backgroundColor: Colors.yellow[900],
            elevation: 15,
            shadowColor: Colors.grey,
            shape: const StadiumBorder(),
          ),
          // when the button is pressed, a dialog box will pop up.
          onPressed: () {
            submit();
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text("Submitted"),
                // code needs logic
                content: Text(
                  "Your Unique Reference Code is: $sixDigit.",
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      // back();
                      homeFunction();
                    },
                    child: const Text("Close"),
                  ),
                ],
              ),
            );
          },

          child: Text(
            "Submit".toUpperCase(),
            style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
                color: Color.fromARGB(255, 255, 255, 255)),
          ),
        ),
      );
}
