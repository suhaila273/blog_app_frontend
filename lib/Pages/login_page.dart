import 'package:blog_app/Services/userService.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController email1=new TextEditingController();
  TextEditingController pass1=new TextEditingController();

  void SendValuesToApi() async {

    final response = await BlogApiService().loginData(email1.text, pass1.text);
    if(response["status"]=="success")
    {
      print("successfully login");
    }
    else if(response["status"]=="invalid email id")
    {
      print("Invalid email id");
    }
    else if(response["status"]=="incorrect password")
    {
      print("Invalid password");
    }
    else
      {
        print("Error");
      }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.white
          ),
          padding: EdgeInsets.all(15),
          child: Column(
            children: [
              SizedBox(height: 70,),
              Image.network(height: 100,"https://cdn.logojoy.com/wp-content/uploads/2018/05/30164225/572.png"),
              SizedBox(height: 60,),
              TextField(
                controller: email1,
                decoration: InputDecoration(
                    labelText: "Username",
                    hintText: "Enter valid username",
                    border: OutlineInputBorder()
                ),
              ),
              SizedBox(height: 20,),
              TextField(
                controller: pass1,
                decoration: InputDecoration(
                    labelText: "Password",
                    hintText: "Enter password",
                    border: OutlineInputBorder()
                ),
              ),
              SizedBox(height: 25,),
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
                    onPressed:SendValuesToApi, child:Text("Log In")),
              ),
              SizedBox(height: 45,),
              Row(
                children: [
                  SizedBox(width: 25,),
                  Text("Don't have an account?",style: TextStyle(color: Colors.black,fontSize: 16),),
                  SizedBox(width: 10,),
                  SizedBox(
                    height: 25,
                    width: 130,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: Color(0xFFE1306C),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)
                            )
                        ),
                        onPressed: (){
                         // Navigator.push(context, MaterialPageRoute(builder: (context)=>SignupPage()));
                        }, child:Text("Sign Up",style: TextStyle(fontWeight: FontWeight.bold),)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),

    );
  }
}
