import 'package:flutter/material.dart';
import 'package:strapi_backend/customisation/textfield.dart';
import 'package:strapi_backend/view/show_users.dart';
import 'package:strapi_backend/view/user.dart';
import 'package:http/http.dart' as http;

class EditUser extends StatefulWidget {
  final Users users;
  const EditUser({Key key, this.users});

  @override
  _EditUserState createState() => _EditUserState();
}

class _EditUserState extends State<EditUser> {
  void editUser(
      {Users users, String email, String password, String name}) async {
    final response = await http.put(
        Uri.parse(
          "http://10.0.2.2:1337/apis/${users.id}",
        ),
        headers: <String, String>{
          'Context-Type': 'application/json;charset=UTF-8',
        },
        body: <String, String>{
          'name': name,
          'email': email,
          'password': password,
        });
    if (response.statusCode == 200) {
      print(response.reasonPhrase);
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (BuildContext context) => DisplayUsers()),
          (Route<dynamic> route) => false);
    } else {
      print(response.statusCode);
      print(response.reasonPhrase);
    }
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController =
        TextEditingController(text: widget.users.email);
    TextEditingController passwordController =
        TextEditingController(text: widget.users.password);
    TextEditingController nameController =
        TextEditingController(text: widget.users.name);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo[700],
        elevation: 0.0,
        title: Text('Edit User'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 100, bottom: 100, left: 18, right: 18),
          child: Container(
            height: 550,
            width: 400,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: Colors.indigo[700],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    width: 300,
                    decoration: BoxDecoration(boxShadow: [
                      
                    ]),
                    child: Textfield(
                      controller: nameController,
                      onChanged: (val) {
                        nameController.text = val;
                      },
                      hintText: 'Name',
                    )),
                SizedBox(
                  height: 10,
                ),
                Container(
                    width: 300,
                    decoration: BoxDecoration(boxShadow: []),
                    child: Textfield(
                      controller: emailController,
                      onChanged: (val) {
                        emailController.text = val;
                      },
                      hintText: 'Email',
                    )),
                Container(
                    width: 300,
                    decoration: BoxDecoration(boxShadow: []),
                    child: Textfield(
                      hintText: 'Password',
                      onChanged: (val) {
                        passwordController.text = val;
                      },
                      controller: passwordController,
                    )),
                SizedBox(
                  width: 100,
                  child: TextButton(
                      style:
                          TextButton.styleFrom(backgroundColor: Colors.white),
                      onPressed: () {
                        editUser(
                            users: widget.users,
                            email: emailController.text,
                            password: passwordController.text,
                            name: nameController.text);
                      },
                      child: Text('Save')),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
