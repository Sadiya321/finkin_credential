import 'package:finkin_credential/res/app_color/app_color.dart';
import 'package:flutter/material.dart';

class InfoDisplay extends StatelessWidget {
  const InfoDisplay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Container(
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
          color: AppColor.textLight,
          borderRadius: BorderRadius.circular(26),
          border: Border.all(
            color:AppColor.textPrimary,
            width:
                1.0, // Adjust the width as needed for the thickness of the border
          ),
        ),
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
              children: [
                _buildSectionTitle('Personal Information'),
                const SizedBox(height: 20),
                _buildListTile('Full Name', 'John Doe'),
                _buildListTile('Email', 'john.doe@example.com'),
                _buildListTile('Phone Number', '+1 123-456-7890'),
                _buildListTile('Verification Code', '123456'),
                _buildListTile('Date of Birth', '01/01/1990'),
                _buildListTile('Address', '123 Main St, City, Country'),
                _buildListTile('Pin Code', '123456'),
                _buildListTile('Nationality', 'Country'),
                _buildListTile('Aadhar Number', '1234 5678 9012'),
                _buildListTile('Aadhar Card Photo', 'AadharCard.jpg'),
                _buildListTile('PAN Number', 'ABCDE1234F'),
                _buildListTile('PAN Card Photo', 'PANCard.jpg'),
                _buildListTile('Employee Type', 'Self Employed'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildListTile(String label, String value) {
    return ListTile(
      title: Text(
        label,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(value),
    );
  }
}
