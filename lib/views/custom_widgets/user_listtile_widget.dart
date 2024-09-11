import 'package:flutter/material.dart';
import 'package:user_list_api/models/users_models.dart';
import 'package:user_list_api/views/user_details_screen.dart';

class UserListTile extends StatelessWidget {
  final User user;
  final double screenHeight;

  const UserListTile({required this.user, required this.screenHeight});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.green[50],
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 15),
        leading: CircleAvatar(
          radius: screenHeight / 25,
          backgroundImage: const NetworkImage(
              "https://wac-cdn.atlassian.com/dam/jcr:ba03a215-2f45-40f5-8540-b2015223c918/Max-R_Headshot%20(1).jpg?cdnVersion=2229"),
        ),
        title: Text(user.name),
        subtitle: Text(
          user.email,
          overflow: TextOverflow.ellipsis,
        ),
        trailing: Icon(Icons.arrow_forward_ios, size: screenHeight / 38),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => UserDetailsScreen(userDetails: user),
            ),
          );
        },
      ),
    );
  }
}
