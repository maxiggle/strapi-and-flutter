import 'package:flutter/material.dart';
import 'package:strapi_backend/view/add_user.dart';

void main() {
  runApp(Strapi());
}

class Strapi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:CreateUser()
    );
  }
}

