import 'package:flutter/material.dart';
import 'package:strapi_backend/customisation/textfield.dart';
import 'package:strapi_backend/view/show_users.dart';
import 'package:http/http.dart' as http;
import 'package:strapi_backend/view/user.dart';

class CreateUser extends StatefulWidget {
  final int id;
  const CreateUser({ Key key,this.id });

  @override
  _CreateUserState createState() => _CreateUserState();
}
 TextEditingController emailController = TextEditingController(text: users.email);
  TextEditingController passwordController = TextEditingController(text: users.password);
  TextEditingController nameController = TextEditingController(text: users.name);

  Users users = Users(0, '', '', '');

class _CreateUserState extends State<CreateUser> {
  Future save() async {
    // var jsonResponse = null;
     await http.post(Uri.parse("http://10.0.2.2:1337/apis/",),headers:<String, String> {
      'Context-Type': 'application/json; charset=UTF-8',
    },body: <String,String> {  'name':users.name,
      'email': users.email,
      'password': users.password,}
    );
    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => DisplayUsers()), (Route<dynamic> route) => false);
      }
  
   
  @override
  Widget build(BuildContext context) {
    //  print(widget.id);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo[700],
        elevation: 0.0,
        title: Text('Create User'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.only(top: 100,bottom: 100,left: 18,right: 18),
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
                   controller:nameController ,
                   onChanged: (val){
                     users.name = val;
                   },
                   hintText: 'Name',
                 )
                 ),
                 SizedBox(height: 10,),
                 Container(
                     width: 300,
                 decoration: BoxDecoration(boxShadow: [
                        ]),
                 child: Textfield(
                   controller: emailController,
                   onChanged: (val){
                     users.email = val;
                   },
                   hintText: 'Email',
                 )
                 ),
                   Container(
                     width: 300,
                 decoration: BoxDecoration(boxShadow: [
                        ]),
                 child: Textfield(
                   hintText: 'Password',
                   onChanged: (val){
                     users.password = val;
                   },
                   controller: passwordController,
                 )
                 ),
                 SizedBox(
                   width: 100,
                   child: TextButton(
                     style: TextButton.styleFrom(backgroundColor: Colors.white),
                     onPressed:save, child: Text('Save')),
                 )
              ],
            ),
          ),
        ),
      ),
    );
    
  }
  
}

 