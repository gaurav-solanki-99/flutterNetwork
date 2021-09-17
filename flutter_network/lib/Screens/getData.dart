import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';


class getData extends StatefulWidget {
  const getData({Key? key}) : super(key: key);

  @override
  State<getData> createState() => _getDataState();
}

class _getDataState extends State<getData> {

    Future<dynamic> callgetData() async
    {
      var res = await  http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));

      return jsonDecode(res.body);

    }


    Future<dynamic> getData2() async
    {


      var APIURL = Uri.parse('https://gorest.co.in/public-api/users');
      Response response =  await get(APIURL,);
      Map<String, dynamic> map = jsonDecode(response.body);

      print("My Json "+map["data"].toString());

      var json = jsonDecode(response.body);
      List data = json['data'];

      //return    data.map((e) => Data.fromJson(e)).toList();

      return   map["data"].toString();



    }


 @override
  Widget build(BuildContext context) {
    return MaterialApp(
      showSemanticsDebugger: false,
        home: Scaffold(

            body: Center(
              child: Container(
                 child: FutureBuilder(
                     //future: callgetData(),
                   future: getData2(),
                     builder: (context, AsyncSnapshot snapshot)
                     {
                       String responce= snapshot.data.toString();


                         if(snapshot.hasData)
                           {


                              print("Response String "+responce);

                              print(jsonDecode(snapshot.data.toString()));



                            return ListView.builder(
                              itemCount: snapshot.data.length,
                                itemBuilder: (BuildContext context, int i){

                                return Text(jsonDecode(snapshot.data.toString()).data[0]['name']);
                            });


                           }

                         if(snapshot.hasError)
                           {
                             return Text("Error "+snapshot.hasError.toString());
                           }
                         return CircularProgressIndicator();
                     },
                 ),


              ),
            ),
        ),
    );
  }
}
