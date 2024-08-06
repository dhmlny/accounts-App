// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, camel_case_types, unused_local_variable, unnecessary_null_comparison

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_3/models/user.dart';
import 'package:task_3/provider/user_provider.dart';
import '../Widgets/user_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          "Users",
          style: TextStyle(color: Colors.white,),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: userProvider.isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : userProvider.errorMassage != null
                ? Center(
                    child: Text(
                      userProvider.errorMassage!,
                    ),
                  )
                : ListView.builder(
                    itemCount: userProvider.users.length,
                    itemBuilder: (context, index) {
                      User user = userProvider.users[index];
                    int n =   Random().nextInt(4) + 1;
                      return User_card(
                        user: user,
                        imagePath: 'assets/images/$n.png',
                      );
                    },
                  ),
      ),
    );
  }
}
