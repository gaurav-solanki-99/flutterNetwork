import 'package:flutter/material.dart';
import 'package:flutter_network/Model/AllUser.dart';
import 'package:flutter_network/Model/Post.dart';
import 'package:flutter_network/Model/User.dart';

import '../Screens.dart';

class JsonParseDemo3 extends StatefulWidget {
  //
  JsonParseDemo3() : super();
  @override
  _JsonParseDemo3State createState() => _JsonParseDemo3State();
}
class _JsonParseDemo3State extends State<JsonParseDemo3> {
  //
  late List<Datum2>  _post;
  late bool _loading;
  @override
  void initState() {
    super.initState();
    _loading = true;
    Service3.getPost().then((users) {
      setState(() {
        _post = users;
        _loading = false;


      });
    });
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text(_loading ? 'Loading...' : 'Users'),
      ),
      body:Container(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
        height: MediaQuery.of(context).size.height * 0.35,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: null == _post ? 0 : _post.length, itemBuilder: (context, index) {

          Datum2 user = _post[index];
          return Container(
            width: MediaQuery.of(context).size.width * 0.6,
            child: Card(
              color: Colors.blue,
              child: Container(
                child: Center(child: Text(user.title, style: TextStyle(color: Colors.white, fontSize: 10.0),)),
              ),
            ),
          );
        }),
      ),

          );

      }
}

// Container(
//
// child: Column(
// mainAxisAlignment: MainAxisAlignment.start,
// children: [
//
// Container(
// height: 100,
// color: Colors.black12,
// )
// //  Container(
// //   color: Colors.white,
// //   child: ListView.builder(
// //
// //     scrollDirection: Axis.horizontal,
// //     // itemCount: null == _post ? 0 : _post.length,
// //     itemCount: 10,
// //     itemBuilder: (context, index) {
// //       Datum2 user = _post[index];
// //
// //
// //       return Container(
// //         color: Colors.yellow,
// //
// //         height: 500,
// //         margin: EdgeInsets.all(10.0),
// //
// //
// //
// //         child: Column(
// //           mainAxisAlignment: MainAxisAlignment.start,
// //           children: [
// //             Text("user.body"),
// //             Text("user.title"),],
// //         ),
// //
// //
// //       );
// //     },
// //   ),
// // ),
//
// ],
// ),
// ),