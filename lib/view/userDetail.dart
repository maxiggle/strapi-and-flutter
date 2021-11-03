import 'package:flutter/material.dart';
import 'package:strapi_backend/view/editUser.dart';
import 'package:strapi_backend/view/show_users.dart';
import 'package:strapi_backend/view/user.dart';
import 'package:http/http.dart' as http;
class MyDetails extends StatefulWidget {
 final  Users users;
  const MyDetails({this.users }) ;

  @override
  _MyDetailsState createState() => _MyDetailsState();
}
 
class _MyDetailsState extends State<MyDetails> {
  @override
  Widget build(BuildContext context) {
    void deleteUser()async{
      await http.delete(Uri.parse("http://10.0.2.2:1337/apis/${widget.users.id}"));
       Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (BuildContext context) => DisplayUsers()),
          (Route<dynamic> route) => false);
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('My Details'),
        elevation: 0.0,
        backgroundColor: Colors.indigo[700],
      ),
      body: Center(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 18,vertical:32),
          child: Column(
            children: [
              Container(
                height:50,
                width: MediaQuery.of(context).size.width,
                color: Colors.indigo[700],
                child: Center(child: Text('Details',style: TextStyle(color: Color(0xffFFFFFF)),)),
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18,vertical: 32),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('${widget.users.id}'),
                      SizedBox(height: 10,),
                      Text(widget.users.name),
                      SizedBox(height: 10,),
                      Text(widget.users.email),
                      SizedBox(height: 10,),
                      Text(widget.users.password),
                      
                    ],
                  ),
                ),
                // height: 455 ,
                width:  MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                   color: Color(0xffFFFFFF),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0,1),

                    ),
                  ]
                ),
                
              ),
              Row(
                children:[
                  TextButton(
                    onPressed: (){
                         Navigator.push(context, MaterialPageRoute(builder: (_)=>EditUser(users: widget.users,)));
                     
                    }, child:Text('Edit'),
                  ),
                  TextButton(
                    onPressed:(){
                      deleteUser();

                    }, child:Text('Delete'),
                  ),
                ]
              )
            ],
          ),
        ),
      ),
    );
  }
}