// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:task_3/Widgets/info_card.dart';
import 'package:task_3/Widgets/text_card.dart';
import 'package:task_3/models/user.dart';

class UserDetails extends StatelessWidget {
  final User user;
  final String imagePath;
  const UserDetails({required this.user, required this.imagePath, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "ID #${user.id}",
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  clipBehavior: Clip.hardEdge,
                  borderRadius: BorderRadius.circular(50),
                  child: Image.asset(imagePath),
                ),
                Text(
                  user.name,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  user.username,
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
                InfoCard(
                  user: user,
                  title: "email",
                  description: user.email,
                  icon: Icons.email,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextCard(
                      text: 'street',
                      subtext: user.address['street'],
                    ),
                                        TextCard(
                      text: 'suite',
                      subtext: user.address['suite'],
                    ),
                                        TextCard(
                      text: 'city',
                      subtext: user.address['city'],
                    ),

                  ],
                ),
                InfoCard(
                  user: user,
                  title: "phone",
                  description: user.phone,
                  icon: Icons.phone,
                ),
                InfoCard(
                  user: user,
                  title: "website",
                  description: user.website,
                  icon: Icons.web,
                ),
                InfoCard(
                  user: user,
                  title: "company",
                  description: user.company['name'],
                  icon: Icons.location_history,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

