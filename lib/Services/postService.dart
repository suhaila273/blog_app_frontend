import 'dart:convert';

import 'package:blog_app/Models/postModel.dart';
import 'package:http/http.dart' as http;



class PostApiService
{
 Future<dynamic> sendData(String userId,String post) async
  {
    var client =http.Client();
    var apiUrl= Uri.parse("http://localhost:3001/api/post/addpost");

    var response =await client.post(apiUrl,
        headers: <String,String>{
          "Content-Type" : "application/json; charset=UTF-8"
        },
        body: jsonEncode(<String,String>{
          "userId": userId,
          "post": post,
        })
    );
    if(response.statusCode==200)
    {
      return json.decode(response.body);
    }
    else
    {
      throw Exception("failed to post");
    }
  }

  Future<List<Post>> getPost() async{
    var client= http.Client();
    var apiUrl=Uri.parse("http://localhost:3001/api/post/viewall");

    var response= await client.get(apiUrl);
    if(response.statusCode==200)
    {
      return postFromJson(response.body);
    }
    else
    {
      return [];
    }

  }
}