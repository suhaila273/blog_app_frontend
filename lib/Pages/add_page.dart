import 'package:blog_app/Pages/view_page.dart';
import 'package:blog_app/Services/postService.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddPage extends StatefulWidget {
  const AddPage({super.key});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  TextEditingController post1=new TextEditingController();

  void SendValuesToApiPost() async {
    SharedPreferences prefer=await SharedPreferences.getInstance();
    String userId=prefer.getString("userId")?? "";
    print("post is : "+post1.text);

    final response = await PostApiService().sendData(userId, post1.text);
    if(response["status"]=="success")
    {
      print("successfully posted");
    }
    else
    {
      print("Error");
    }

  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(onPressed: (){
            Navigator.pop(context);
            },
              icon: Icon(Icons.arrow_back_ios_new,color: Colors.white,)),
          title: Text("My page",style: TextStyle(color: Colors.white),),
          backgroundColor: Color(0xFFE1306C),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(15),
            width: double.infinity,
            child: Column(
              children: [
                SizedBox(height: 20,),
                TextField(
                  controller: post1,
                  decoration: InputDecoration(
                      labelText: "Add Post",
                      hintText: "Enter here!",
                      border: OutlineInputBorder()
                  ),
                ),
                SizedBox(height: 20,),
                SizedBox(
                    height: 45,
                    width: 250,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFFE1306C),
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)
                            )
                        ),
                        onPressed: SendValuesToApiPost, child: Text("POST"))),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
