import 'package:flutter/material.dart';
import 'package:user_list_api/views/custom_widgets/user_listtile_widget.dart';
import 'package:user_list_api/models/users_models.dart';

class UserListView extends StatelessWidget {
  final List<User> users;

  const UserListView({super.key, required this.users});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 3),
      itemCount: users.length,
      itemBuilder: (context, index) {
        final user = users[index];
        return UserListTile(user: user, screenHeight: screenHeight);
      },
    );
  }
}
