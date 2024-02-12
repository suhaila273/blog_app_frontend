import 'package:blog_app/Pages/add_page.dart';
import 'package:blog_app/Pages/view_page.dart';
import 'package:flutter/material.dart';

class PostMenu extends StatelessWidget {
  const PostMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(onPressed: (){Navigator.pop(context);},
              icon: Icon(Icons.arrow_back_ios_new,color: Colors.white,)),
          title: Text("Menu Page",style: TextStyle(color: Colors.white),),
          backgroundColor: Color(0xFFE1306C),
        ),
        body: Container(
          //padding: EdgeInsets.all(15),
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(height: 120,"https://cdn-icons-png.freepik.com/256/9611/9611762.png"),
              SizedBox(height: 50,),
              SizedBox(
                  height: 45,
                  width: 300,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFFE1306C),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)
                          )
                      ),
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>AddPage()));
                      }, child: Text("Add post"))),

              SizedBox(height: 40,),
              SizedBox(
                  height: 45,
                  width: 300,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFFE1306C),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)
                          )
                      ),
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>ViewPage()));
                      }, child: Text("View All post"))),

            ],
          ),
        ),
      ),
    );
  }
}
