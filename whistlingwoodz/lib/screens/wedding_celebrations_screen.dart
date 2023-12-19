import 'package:flutter/material.dart';
import 'package:whistlingwoodz/main.dart';

class Wedding extends StatefulWidget {
  const Wedding({super.key, required this.data});
  final bool data;

  @override
  State<Wedding> createState() => _WeddingState();
}

class _WeddingState extends State<Wedding> {
  submitFunction() {
    runApp(MaterialApp(
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      title: 'Whistlingwoodz',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      // ignore: prefer_const_constructors
      home: MyApp(selectedIndex: 6),
    ));
  }

  // list variables for drop down menus
  final List<String> _themeList = ["Classic", "Contemporary", "Customized"];
  final List<String> _functionList = [
    "Haldi - Mehndi",
    "Shagun - Engagement",
    "Wedding",
    "Reception"
  ];
  final List<String> _venueList = [
    "Hyatt Place Melbounre",
    "Hyatt Place Carribean Park",
    "Grand Hyatt Melbourne",
    "Park Hyatt Melbourne",
    "Hyatt Centric Melbourne",
    "The Langham Melbourne",
    "Other"
  ];
  final List<String> _budgetList = [
    r"$20,000 - $29,999",
    r"$30,000 - $39,999",
    r"$40,000 - $60,000",
    "Other"
  ];

  // initial values for drop down menus
  String? _selectedTheme = "Classic";
  String? _selectedFunction = "Haldi - Mehndi";
  String? _selectedVenue = "Hyatt Place Melbounre";
  String? _selectedBudget = r"$20,000 - $29,999";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: const AppBarPage(data: widget.data),
      resizeToAvoidBottomInset: false,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        // backgound photo for landing page
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/weddingPage.png"),
            opacity: 0.5,
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
                          'WEDDING',
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
                              padding: const EdgeInsets.fromLTRB(25, 30, 25, 0),
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
                                  if (_selectedVenue != _venueList[6])
                                    _buildVenue(),
                                  if (_selectedVenue == _venueList[6])
                                    TextFormField(
                                      autofocus: false,
                                      decoration: const InputDecoration(
                                        labelText: "Other Venue*",
                                        prefixIcon: Icon(
                                          Icons.place,
                                          color: Colors.deepOrangeAccent,
                                        ),
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(10),
                                          ),
                                        ),
                                      ),
                                    ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  _buildGuest(),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  // Budget drop down menu
                                  if (_selectedBudget != _budgetList[3])
                                    _buildBudget(),
                                  if (_selectedBudget == _budgetList[3])
                                    TextFormField(
                                      autofocus: false,
                                      keyboardType: TextInputType.number,
                                      decoration: const InputDecoration(
                                        labelText: "Other*",
                                        prefixIcon: Icon(
                                          Icons.attach_money,
                                          color: Colors.deepOrangeAccent,
                                        ),
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(10),
                                          ),
                                        ),
                                      ),
                                    ),
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
          ),
          onPressed: () {
            submitFunction();
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
