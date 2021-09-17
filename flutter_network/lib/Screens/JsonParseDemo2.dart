import 'package:flutter/material.dart';
import 'package:flutter_network/Model/AllUser.dart';
import 'package:flutter_network/Model/User.dart';

import '../Screens.dart';

class JsonParseDemo2 extends StatefulWidget {
  //
  JsonParseDemo2() : super();
  @override
  _JsonParseDemo2State createState() => _JsonParseDemo2State();
}
class _JsonParseDemo2State extends State<JsonParseDemo2> {
  //
  late List<Datum>  _users;
  late bool _loading;
  @override
  void initState() {
    super.initState();
    _loading = true;
    Service2.getAllUser().then((users) {
      setState(() {
        _users = users;
        _loading = false;


      });
    });
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_loading ? 'Loading...' : 'Users'),
      ),
      body: Container(
        color: Colors.white,
        child: ListView.builder(
          itemCount: null == _users ? 0 : _users.length,
          itemBuilder: (context, index) {
            Datum user = _users[index];
            return Container(
              alignment: Alignment.centerLeft,
              padding:  EdgeInsets.all(10.0),
              margin: EdgeInsets.all(10.0),

              decoration:  BoxDecoration(
                  color: Colors.blueAccent


              ),


              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(user.name),
                  Text(user.email),
                  Text(user.email),


                ],
              ),


            );
          },
        ),
      ),
    );
  }
}