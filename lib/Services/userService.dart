import 'dart:convert';

import 'package:http/http.dart' as http;



class BlogApiService
{
  Future<dynamic> loginData(String email,String password)async {
    var client =http.Client();
    var apiUrl= Uri.parse("http://localhost:3001/api/signup/login");

    var response =await client.post(apiUrl,
        headers: <String,String>{
          "Content-Type" : "application/json; charset=UTF-8"
        },
        body: jsonEncode(<String,String>{
          "email": email,
          "password": password,

        })
    );
    if(response.statusCode==200)
    {
      return json.decode(response.body);
    }
    else
    {
      throw Exception("failed to login");
    }
  }
}
  /*Future<dynamic> sendData(String visitorName,String visitorPhone,String visitorAadhar,String visitorPlace,String purposeOfVisit) async
  {
    var client =http.Client();
    var apiUrl= Uri.parse("http://localhost:3001/api/visitor/add");

    var response =await client.post(apiUrl,
        headers: <String,String>{
          "Content-Type" : "application/json; charset=UTF-8"
        },
        body: jsonEncode(<String,String>{
          "name": visitorName,
          "place":visitorPlace,
          "adhar":visitorAadhar,
          "phone": visitorPhone,
          "purpose":purposeOfVisit,
        })
    );
    if(response.statusCode==200)
    {
      return json.decode(response.body);
    }
    else
    {
      throw Exception("failed to add");
    }
  }*/


