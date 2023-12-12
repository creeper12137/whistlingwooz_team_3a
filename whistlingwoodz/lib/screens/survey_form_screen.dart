import 'package:flutter/material.dart';
import 'package:whistlingwoodz/screens/landing_page_screen.dart';
import 'package:whistlingwoodz/widgets/app_bar_widget.dart';
import 'package:whistlingwoodz/widgets/bottom_navigation_bar_widget.dart';

class SurveyForm extends StatefulWidget {
  const SurveyForm({super.key});

  @override
  State<SurveyForm> createState() => _SurveyFormState();
}

class _SurveyFormState extends State<SurveyForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarPage(),
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
      bottomNavigationBar: const BottomBar(),
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LandingPage(),
                        ),
                      );
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




// import 'package:flutter/material.dart';
// import 'package:whistlingwoodz/widgets/app_bar_widget.dart';
// import 'package:whistlingwoodz/widgets/bottom_navigation_bar_widget.dart';

// class SurveyForm extends StatefulWidget {
//   const SurveyForm({super.key});

//   @override
//   State<SurveyForm> createState() => _SurveyFormState();
// }

// class _SurveyFormState extends State<SurveyForm> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: const AppBarPage(),
//       body: Container(
//         decoration: const BoxDecoration(
//           gradient: RadialGradient(
//             colors: [
//               Color.fromARGB(255, 139, 46, 43),
//               Color(0xff510400),
//             ],
//           ),
//         ),
//         child: Center(
//           child: SingleChildScrollView(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Image.asset(
//                   'assets/images/mandalaTop.png',
//                   width: 300,
//                 ),
//                 const Text(
//                   'This is for the Survery form view',
//                   style: TextStyle(
//                     color: Color(0xffFFD700),
//                     fontSize: 15,
//                     fontStyle: FontStyle.italic,
//                     fontWeight: FontWeight.w500,
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 Image.asset(
//                   'assets/images/mandala.png',
//                   width: 700,
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//       bottomNavigationBar: const BottomBar(),
//     );
//   }
// }
