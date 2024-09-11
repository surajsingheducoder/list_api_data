import 'package:flutter/material.dart';
import 'package:user_list_api/models/users_models.dart';
import 'package:user_list_api/services/api_services.dart';

class UserListController extends ChangeNotifier {
  List<User> _users = [];
  bool _isLoading = false;
  String _errorMessage = '';

  List<User> get users => _users;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  Future<void> fetchUsers() async {
    _isLoading = true;
    _errorMessage = '';
    notifyListeners();

    try {
      _users = await ApiServices().fetchUsers();
    } catch (e) {
      _errorMessage = 'Failed to load data: $e';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> refresh() async {
    fetchUsers();
  }
}
