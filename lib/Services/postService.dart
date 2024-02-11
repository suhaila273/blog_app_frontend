import 'package:blog_app/Models/postModel.dart';
import 'package:http/http.dart' as http;



class PostApiService
{
 /* Future<dynamic> sendData(String visitorName,String visitorPhone,String visitorAadhar,String visitorPlace,String purposeOfVisit) async
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