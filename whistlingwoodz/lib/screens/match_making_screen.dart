import 'package:flutter/material.dart';

class MatchMakingScreen extends StatelessWidget {
  const MatchMakingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Indian Matchmaking Form'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSectionTitle('Personal Information:'),
              _buildFullNameField('Bride'),
              _buildFullNameField('Groom'),
              _buildGenderField('Bride'),
              _buildGenderField('Groom'),
              _buildDateOfBirthField('Bride'),
              _buildDateOfBirthField('Groom'),
              _buildPlaceOfBirthField('Bride'),
              _buildPlaceOfBirthField('Groom'),
              _buildTextField('Caste', 'Specify the caste of the bride and groom.'),
              _buildTextField('Religion', 'Specify the religion of the bride and groom.'),
              _buildTextField('Sub-Caste (if applicable)', 'Specify the sub-caste details.'),

              _buildSectionTitle('Contact Information:'),
              _buildTextField('Email Address - Bride', 'Enter bride\'s email address.'),
              _buildTextField('Email Address - Groom', 'Enter groom\'s email address.'),
              _buildTextField('Phone Number - Bride', 'Enter bride\'s phone number.'),
              _buildTextField('Phone Number - Groom', 'Enter groom\'s phone number.'),

              _buildSectionTitle('Educational Background:'),
              _buildTextField('Education Level - Bride', 'Enter bride\'s highest education level.'),
              _buildTextField('Education Level - Groom', 'Enter groom\'s highest education level.'),
              _buildTextField('Occupation - Bride', 'Enter bride\'s occupation.'),
              _buildTextField('Occupation - Groom', 'Enter groom\'s occupation.'),

              _buildSectionTitle('Family Details:'),
              _buildTextField('Family Background - Bride', 'Briefly describe bride\'s family background.'),
              _buildTextField('Family Background - Groom', 'Briefly describe groom\'s family background.'),
              _buildTextField('Siblings', 'Number of siblings and their details (if applicable).'),

              _buildSectionTitle('Preferences:'),
              _buildTextField('Partner Preferences', 'Specify the qualities and characteristics preferred in a life partner.'),
              _buildTextField('Cultural Preferences', 'Specify any cultural or religious preferences.'),

              _buildSectionTitle('Photographs:'),
              _buildTextField('Recent Photographs', 'Attach recent photographs of the bride and groom.'),

              _buildSectionTitle('Additional Information:'),
              _buildTextField('Specific Considerations', 'Include any additional information that may be relevant.'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildFullNameField(String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('$label\'s Full Name:'),
        TextField(
          decoration: InputDecoration(
            hintText: 'Enter $label\'s full name',
          ),
        ),
      ],
    );
  }

  Widget _buildGenderField(String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('$label\'s Gender:'),
        Row(
          children: [
            Radio(value: 'Female', groupValue: null, onChanged: (value) {}),
            Text('Female'),
            Radio(value: 'Male', groupValue: null, onChanged: (value) {}),
            Text('Male'),
          ],
        ),
      ],
    );
  }

  Widget _buildDateOfBirthField(String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('$label\'s Date of Birth:'),
        TextField(
          decoration: InputDecoration(
            hintText: 'Enter $label\'s date of birth',
          ),
        ),
      ],
    );
  }

  Widget _buildPlaceOfBirthField(String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('$label\'s Place of Birth:'),
        TextField(
          decoration: InputDecoration(
            hintText: 'Enter $label\'s place of birth',
          ),
        ),
      ],
    );
  }

  Widget _buildTextField(String label, String hint) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label + ':'),
        TextField(
          decoration: InputDecoration(
            hintText: hint,
          ),
        ),
      ],
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: const Wedding(),
  ));
}

