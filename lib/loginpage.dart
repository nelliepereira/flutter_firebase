import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'main.dart';

class loginpage extends StatefulWidget {
  @override
  _loginpageState createState() => _loginpageState();
}

class _loginpageState extends State<loginpage> {
  final ref = Firestore.instance.collection('LoginDetails');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            StreamBuilder(
              stream: ref.snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if(snapshot.hasData) {
                  return Container(
                    height: 500,
                    child: ListView.builder(
                      itemCount: snapshot.data.documents.length,
                      itemBuilder: (context,index) {
                        return Container(
                          height: 150,
                          child: Card(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Text(snapshot.data.documents[index].data['Username']),
                                Text(snapshot.data.documents[index].data['Password']),
                                Image.network(snapshot.data.documents[index].data['Profilepic'], height: 100,),
                              ],
                            ),
                          ),
                        );
                      },

                    ),
                  );
                }  else
                  return CircularProgressIndicator();
              },
            )
          ],
        ),
      ),
    );
  }
}
