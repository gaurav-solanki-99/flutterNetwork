import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_network/Model/User.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import 'Model/AllUser.dart';
import 'Model/Post.dart';

class Services{

  static const String url ="https://jsonplaceholder.typicode.com/users";
  static Future<List<User>> getUsers() async {
    try {
      final response = await http.get(Uri.parse(url));
      if (200 == response.statusCode) {
        final List<User> users = userFromJson(response.body);
        return users;
      } else {
        return <User>[];
      }
    } catch (e) {
      return <User>[];
    }
  }




 
}


class Service2
{
  static const String url ="https://gorest.co.in/public-api/users";

  static Future<List<Datum>> getAllUser() async
  {

    try {
      final response = await http.get(Uri.parse(url));

       int code =response.statusCode;
      print("Response Code of UserAll $code ");


      if (200 == response.statusCode) {
        final  AllUser allUser = AllUser.fromJson(json.decode(response.body));


        return allUser.data;




      } else {
        return  <Datum>[];
      }
    } catch (e) {
      return  <Datum>[];
    }
  }

}

class Service3
{
  static const String url ="https://gorest.co.in/public/v1/posts";

  static  Future<List<Datum2>> getPost() async
   {
     try {
       final response = await http.get(Uri.parse(url));

       int code =response.statusCode;
       print("Response Code of UserAll $code ");


       if (200 == response.statusCode) {
         final  Post allpost = Post.fromJson(json.decode(response.body));


         return allpost.data;




       } else {
         return  <Datum2>[];
       }
     } catch (e) {
       return  <Datum2>[];
     }
   }
}