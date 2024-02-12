import 'package:blog_app/Services/userService.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  TextEditingController name1= new TextEditingController();
  TextEditingController age1= new TextEditingController();
  TextEditingController mobile1= new TextEditingController();
  TextEditingController address1= new TextEditingController();
  TextEditingController pincode1= new TextEditingController();
  TextEditingController email1= new TextEditingController();
  TextEditingController password1= new TextEditingController();

  void SendValuesToApiSignUp() async {

    final response = await BlogApiService().sendData(
        name1.text,
        age1.text,
        mobile1.text,
        address1.text,
        pincode1.text,
        email1.text,
        password1.text);
    if(response["status"]=="success")
    {
      print("successfully signup");
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
          leading: IconButton(onPressed: (){Navigator.pop(context);},
              icon: Icon(Icons.arrow_back_ios_new,color: Colors.white,)),
          title: Text("Sign Up !",style: TextStyle(color: Colors.white),),
          backgroundColor: Color(0xFFE1306C),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(15),
            width: double.infinity,
            child: Column(
              children: [
                SizedBox(height: 10,),
                TextField(
                  controller: name1,
                  decoration: InputDecoration(
                      labelText: "Name",
                      hintText: "Enter your name",
                      border: OutlineInputBorder()
                  ),
                ),
                SizedBox(height: 15,),
                TextField(
                  controller: age1,
                  decoration: InputDecoration(
                      labelText: "Age",
                      hintText: "Enter your age",
                      border: OutlineInputBorder()
                  ),
                ),
                SizedBox(height: 15,),
                TextField(
                  controller: mobile1,
                  decoration: InputDecoration(
                      labelText: "Phone no",
                      hintText: "Enter phone no",
                      border: OutlineInputBorder()
                  ),
                ),
                SizedBox(height: 15,),
                TextField(
                  controller: address1,
                  decoration: InputDecoration(
                      labelText: "Address",
                      hintText: "Enter your address",
                      border: OutlineInputBorder()
                  ),
                ),
                SizedBox(height: 15,),
                TextField(
                  controller: pincode1,
                  decoration: InputDecoration(
                      labelText: "Pincode",
                      hintText: "Enter pincode",
                      border: OutlineInputBorder()
                  ),
                ),
                SizedBox(height: 15,),
                TextField(
                  controller: email1,
                  decoration: InputDecoration(
                      labelText: "Email Id",
                      hintText: "Enter your email id",
                      border: OutlineInputBorder()
                  ),
                ),
                SizedBox(height: 15,),
                TextField(
                  controller: password1,
                  decoration: InputDecoration(
                      labelText: "Password",
                      hintText: "Enter password",
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
                        onPressed: SendValuesToApiSignUp, child: Text("Sign Up"))),

              ],
            ),
          ),
        ),

      ),
    );
  }
}
