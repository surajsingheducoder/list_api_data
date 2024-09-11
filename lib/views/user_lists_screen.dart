import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controller/user_list_controller.dart';
import '../models/users_models.dart';
import 'custom_widgets/listview_widget.dart';
import 'custom_widgets/search_bar_widget.dart';


class UserListScreen extends StatefulWidget {
  const UserListScreen({super.key});

  @override
  State<UserListScreen> createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<User> _filteredUsers = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<UserListController>(context, listen: false).fetchUsers();
    });
    _searchController.addListener(_filterUsers);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _filterUsers() {
    final provider = Provider.of<UserListController>(context, listen: false);
    final query = _searchController.text.toLowerCase();

    setState(() {
      _filteredUsers = query.isEmpty
          ? provider.users
          : provider.users
          .where((user) => user.name.toLowerCase().contains(query))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xff003366),
        title: const Text('User List', style: TextStyle(color: Colors.white, fontSize: 20)),
      ),
      body: Column(
        children: [
          SearchBarWidget(controller: _searchController,),
          Expanded(
            child: Consumer<UserListController>(
              builder: (context, provider, child) {
                if (provider.isLoading) {
                  return const Center(child: CupertinoActivityIndicator());
                } else if (provider.errorMessage.isNotEmpty) {
                  return Center(child: Text(provider.errorMessage));
                } else {
                  final usersToShow = _searchController.text.isNotEmpty
                      ? _filteredUsers
                      : provider.users;

                  return RefreshIndicator(
                    onRefresh: provider.refresh,
                    child: UserListView(users: usersToShow),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
