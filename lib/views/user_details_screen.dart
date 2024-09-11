import 'package:flutter/material.dart';
import 'package:user_list_api/models/users_models.dart';

class UserDetailsScreen extends StatelessWidget {
  final User userDetails;

  const UserDetailsScreen({super.key, required this.userDetails});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        titleSpacing: 0,
        backgroundColor: const Color(0xff003366),
        iconTheme: const IconThemeData(
          color: Colors.white
        ),
        title: Text(
          'User Details',
          style: TextStyle(color: Colors.white, fontSize: screenHeight/38),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // User's profile image
            SizedBox(
              height: screenHeight / 3.5,
              width: double.infinity,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                  "https://wac-cdn.atlassian.com/dam/jcr:ba03a215-2f45-40f5-8540-b2015223c918/Max-R_Headshot%20(1).jpg?cdnVersion=2229",
                  fit: BoxFit.cover,
                ),
              ),
            ),

            SizedBox(height: screenHeight/35),

            // User information section
            _buildUserInfo('Name', userDetails.name),
            _buildUserInfo('Username', userDetails.username),
            _buildUserInfo('Email', userDetails.email),
            _buildUserInfo('Phone', userDetails.phone),
            _buildUserInfo('Website', userDetails.website),

            SizedBox(height: screenHeight/35),

            // Address section
            _buildSectionTitle('Address'),
            _buildUserInfo(
              '',
              '${userDetails.address.street}, ${userDetails.address.suite}, '
                  '${userDetails.address.city}, ${userDetails.address.zipcode}',
            ),

            SizedBox(height: screenHeight/35),

            // Company section
            _buildSectionTitle('Company'),
            _buildUserInfo('Name', userDetails.company.name),
            _buildUserInfo('Catchphrase', userDetails.company.catchPhrase, isItalic: true),
          ],
        ),
      ),
    );
  }

  // Helper method to build user info rows
  Widget _buildUserInfo(String label, String info, {bool isItalic = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: RichText(
        text: TextSpan(
          text: label.isNotEmpty ? '$label: ' : '',
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
          children: [
            TextSpan(
              text: info,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
                fontStyle: isItalic ? FontStyle.italic : FontStyle.normal,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to build section titles
  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        title,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
      ),
    );
  }
}
