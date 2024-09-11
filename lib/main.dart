import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_list_api/controller/user_list_controller.dart';
import 'package:user_list_api/views/user_lists_screen.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserListController(),)
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: UserListScreen(),
      ),
    );
  }
}

