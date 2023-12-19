import 'package:flutter/material.dart';
import 'package:whistlingwoodz/main.dart';

class SurveyForm extends StatefulWidget {
  const SurveyForm({super.key, required this.data});
  final bool data;

  @override
  State<SurveyForm> createState() => _SurveyFormState();
}

class _SurveyFormState extends State<SurveyForm> {
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

  @override
  Widget build(BuildContext context) {
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
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text("Submitted"),
                // code needs logic
                content: const Text(
                    "Your Unique Reference Code is: W28163."), // C14672 or P48216.
                actions: [
                  TextButton(
                    onPressed: () {
                      homeFunction();
                      Navigator.pop(context);
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
