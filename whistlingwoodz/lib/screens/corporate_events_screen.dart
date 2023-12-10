import 'package:flutter/material.dart';
import 'package:whistlingwoodz/widgets/app_bar_widget.dart';
import 'package:whistlingwoodz/widgets/bottom_navigation_bar_widget.dart';
import 'package:whistlingwoodz/screens/survey_form_screen.dart';

class Corporate extends StatefulWidget {
  const Corporate({super.key});

  @override
  State<Corporate> createState() => _CorporateState();
}

class _CorporateState extends State<Corporate> {
  // list variables for drop down menus
  final _themeList = [
    "Business",
    "Product Context",
    "Symposium Sense",
    "Alliance Affair"
  ];
  final _functionList = [
    "Product Launch",
    "Trade Show",
    "Gala Dinner",
    "X-Mas Party",
    "EOY Celebrations"
  ];
  final _venueList = [
    "Hyatt Place Melbounre",
    "Hyatt Place Carribean Park",
    "Grand Hyatt Melbourne",
    "Park Hyatt Melbourne",
    "Hyatt Centric Melbourne",
    "The Langham Melbourne",
    "Other"
  ];
  final _budgetList = [
    r"$20,000 - $29,999",
    r"$30,000 - $39,999",
    r"$40,000 - $60,000",
    "Other"
  ];

  // initial values for drop down menus
  String? _selectedTheme = "Business";
  String? _selectedFunction = "Product Launch";
  String? _selectedVenue = "Hyatt Place Melbounre";
  String? _selectedBudget = r"$20,000 - $29,999";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarPage(data:false),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        // backgound photo for landing page
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/corporatePage.png"),
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
                          'CORPORATE',
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
                                  // Theme drop down menu
                                  _buildTheme(),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  // Functions drop down menu
                                  _buildFunction(),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  // Venue drop down menu
                                  _buildVenue(),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  _buildGuest(),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  // Budget drop down menu
                                  _buildBudget(),
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

  // Theme drop down menu
  Widget _buildTheme() => DropdownButtonFormField(
        value: _selectedTheme,
        items: _themeList
            .map(
              (e) => DropdownMenuItem(
                value: e,
                child: Text(e),
              ),
            )
            .toList(),
        onChanged: (value) {
          setState(() {
            _selectedTheme = value as String;
          });
        },
        icon: const Icon(
          Icons.arrow_drop_down_circle,
          size: 20,
          color: Colors.deepOrangeAccent,
        ),
        dropdownColor: Colors.yellow.shade50,
        decoration: const InputDecoration(
          labelText: "Select Theme*",
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

  // Functions drop down menu
  Widget _buildFunction() => DropdownButtonFormField(
        value: _selectedFunction,
        items: _functionList
            .map(
              (e) => DropdownMenuItem(
                value: e,
                child: Text(e),
              ),
            )
            .toList(),
        onChanged: (value) {
          setState(() {
            _selectedFunction = value as String;
          });
        },
        icon: const Icon(
          Icons.arrow_drop_down_circle,
          size: 20,
          color: Colors.deepOrangeAccent,
        ),
        dropdownColor: Colors.yellow.shade50,
        decoration: const InputDecoration(
          labelText: "Select Functions*",
          prefixIcon: Icon(
            Icons.book_online,
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

  // Venue drop down menu
  Widget _buildVenue() => DropdownButtonFormField(
        value: _selectedVenue,
        items: _venueList
            .map(
              (e) => DropdownMenuItem(
                value: e,
                child: Text(e),
              ),
            )
            .toList(),
        onChanged: (value) {
          setState(() {
            _selectedVenue = value as String;
          });
        },
        icon: const Icon(
          Icons.arrow_drop_down_circle,
          size: 20,
          color: Colors.deepOrangeAccent,
        ),
        dropdownColor: Colors.yellow.shade50,
        decoration: const InputDecoration(
          labelText: "Select Venue*",
          prefixIcon: Icon(
            Icons.place,
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

  // guest text form field
  Widget _buildGuest() => TextFormField(
        autofocus: false,
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(
          labelText: "Number of Guests*",
          prefixIcon: Icon(
            Icons.group,
            color: Colors.deepOrangeAccent,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
        ),
      );

  // Budget drop down menu
  Widget _buildBudget() => DropdownButtonFormField(
        value: _selectedBudget,
        items: _budgetList
            .map(
              (e) => DropdownMenuItem(
                value: e,
                child: Text(e),
              ),
            )
            .toList(),
        onChanged: (value) {
          setState(() {
            _selectedBudget = value as String;
          });
        },
        icon: const Icon(
          Icons.arrow_drop_down_circle,
          size: 20,
          color: Colors.deepOrangeAccent,
        ),
        dropdownColor: Colors.yellow.shade50,
        decoration: const InputDecoration(
          labelText: "Select Budget*",
          prefixIcon: Icon(
            Icons.attach_money,
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
            // shape: RoundedRectangleBorder(
            //   borderRadius:
            //       BorderRadius.circular(10),
            // ),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SurveyForm(),
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
