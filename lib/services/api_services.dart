import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:user_list_api/models/users_models.dart';

class ApiServices {
  static String url = "https://jsonplaceholder.typicode.com/users";

  Future<List<User>> fetchUsers() async {
  final response = await http.get(Uri.parse(url));

  if(response.statusCode == 200){
    List<dynamic> data = jsonDecode(response.body);
    return data.map((json) => User.fromJson(json)).toList();
  }
  else{
    throw Exception("Failed to load Data");
  }
  }
}