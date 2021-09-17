import 'package:flutter/material.dart';
import 'package:flutter_network/Screens/JsonParseDemo3.dart';
import 'package:flutter_network/Screens/getData.dart';

import 'Screens/JsonParseDemo.dart';
import 'Screens/JsonParseDemo2.dart';

void main() {
  runApp(MaterialApp(home: MainPage()));
}


class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: SafeArea(
            child:  Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                    color: Colors.white,
                alignment: Alignment.center,
                child: Column(
                  children: [
                   SizedBox(
                       height:MediaQuery.of(context).size.height/3,
                   ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.black12,

                      ),
                      child: FlatButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>JsonParseDemo3()));

                      }, child:
                      Text("Api1")),
                    ),
                    SizedBox(height: 50,),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.black12,

                      ),
                      child: FlatButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>JsonParseDemo2()));

                      }, child:
                      Text("Api2")),
                    ),
                    SizedBox(height: 50,),


                    Container(
                      decoration: BoxDecoration(
                        color: Colors.black12,

                      ),
                      child: FlatButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>JsonParseDemo()));

                      }, child:
                      Text("Api3")),
                    ),



            ],
          ),
        ),
        )

    );
  }
}



