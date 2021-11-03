import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:strapi_backend/view/user.dart';
import 'package:strapi_backend/view/userDetail.dart';

class DisplayUsers extends StatefulWidget {
  const DisplayUsers({Key key}) : super(key: key);

  @override
  _DisplayUsersState createState() => _DisplayUsersState();
}

class _DisplayUsersState extends State<DisplayUsers> {
  List<Users> user = [];
  Future<List<Users>> getAll() async {
    var response = await http.get(Uri.parse("http://10.0.2.2:1337/apis/"));
  
    if(response.statusCode==200){
      user.clear();
    }
    var decodedData = jsonDecode(response.body);

    for (var u in decodedData) {
      user.add(Users(u['id'], u['name'], u['email'], u['password']));
    }
    return user;
  }

  @override
  Widget build(BuildContext context) {
    getAll();
    return Scaffold(
        appBar: AppBar(
          title: Text('Display Users'),
          elevation: 0.0,
          backgroundColor: Colors.indigo[700],
        ),
        body: FutureBuilder(
            future: getAll(),
            builder: (context, AsyncSnapshot<List<Users>> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, index) => 
                  InkWell(
                    child: ListTile(
                      title: Text(snapshot.data[index].name),
                      subtitle: Text(snapshot.data[index].email),
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (_)=>MyDetails(users: snapshot.data[index],)));
                      },
                    ),
                  )
                );
              }
            ));
  }
}
