import 'package:flutter/material.dart';
import 'package:whistlingwoodz/widgets/app_bar_widget.dart';
import 'package:whistlingwoodz/widgets/bottom_navigation_bar_widget.dart';
import 'package:whistlingwoodz/screens/services_screen.dart';

class InquiryForm extends StatefulWidget {
  const InquiryForm({super.key});

  @override
  State<InquiryForm> createState() => _InquiryFormState();
}

class _InquiryFormState extends State<InquiryForm> {
  // variable for the type drop down menus
  final _typeList = [
    "Wedding",
    "Corporate",
    "Parties",
    "Others",
  ];

  // initial values for drop down menus
  String? _selectedType = "Wedding";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarPage(data: false),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        // backgound photo for landing page
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/twohearts.png"),
            opacity: 0.6,
            fit: BoxFit.cover,
          ),
        ),
        // The box for the drop down menu section
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
                        // tab title
                        const SizedBox(
                          height: 30,
                        ),
                        const Text(
                          'INQUIRY FORM',
                          style: TextStyle(
                            // color: Colors.black,
                            // color: Color(0xffFFD700),
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2,
                          ),
                        ),
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(30, 30, 30, 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // name text form field
                                  _buildName(),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  // email text form field
                                  _buildEmail(),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  // phone text form field
                                  _buildPhone(),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  // type text form field
                                  _buildType(),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  // inquiry text form field
                                  _buildInquiry(),
                                  const SizedBox(
                                    height: 20,
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

  // full name text form field
  Widget _buildName() => TextFormField(
        autofocus: false,
        keyboardType: TextInputType.name,
        decoration: const InputDecoration(
          labelText: "Full Name*",
          prefixIcon: Icon(
            Icons.person,
            color: Colors.deepOrangeAccent,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
        ),
      );

  // email text form field
  Widget _buildEmail() => TextFormField(
        autofocus: false,
        keyboardType: TextInputType.emailAddress,
        decoration: const InputDecoration(
          labelText: "Email*",
          prefixIcon: Icon(
            Icons.email,
            color: Colors.deepOrangeAccent,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
        ),
      );

  // phone text form field
  Widget _buildPhone() => TextFormField(
        autofocus: false,
        keyboardType: TextInputType.phone,
        decoration: const InputDecoration(
          labelText: "Phone*",
          prefixIcon: Icon(
            Icons.phone,
            color: Colors.deepOrangeAccent,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
        ),
      );

  // type drop down menu
  Widget _buildType() => DropdownButtonFormField(
        value: _selectedType,
        items: _typeList
            .map(
              (e) => DropdownMenuItem(
                value: e,
                child: Text(e),
              ),
            )
            .toList(),
        onChanged: (value) {
          setState(() {
            _selectedType = value as String;
          });
        },
        icon: const Icon(
          Icons.arrow_drop_down_circle,
          size: 20,
          color: Colors.deepOrangeAccent,
        ),
        dropdownColor: Colors.yellow.shade50,
        decoration: const InputDecoration(
          labelText: "Select Type*",
          prefixIcon: Icon(
            Icons.subject,
            color: Colors.deepOrangeAccent,
          ),
          // Todo: check UnderlineInputBorder() option
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
        ),
      );

  // inquiry text form field
  Widget _buildInquiry() => TextFormField(
        autofocus: false,
        maxLines: 10,
        keyboardType: TextInputType.multiline,
        decoration: const InputDecoration(
          labelText: "Enter your message here*",
          alignLabelWithHint: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
        ),
      );

  // submit button
  Widget _buildSubmit() => SizedBox(
        width: double.infinity,
        child: OutlinedButton(
          style: TextButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 26),
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
                title: const Text("Form Submitted"),
                content: const Text("Thank you for your inquiry!"),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Services(),
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
            "Submit Form".toUpperCase(),
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
              color: Colors.white,
            ),
          ),
        ),
      );
}
