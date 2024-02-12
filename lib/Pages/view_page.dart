import 'package:blog_app/Models/postModel.dart';
import 'package:blog_app/Pages/add_page.dart';
import 'package:blog_app/Services/postService.dart';
import 'package:flutter/material.dart';

class ViewPage extends StatefulWidget {
  const ViewPage({super.key});

  @override
  State<ViewPage> createState() => _ViewPageState();
}

class _ViewPageState extends State<ViewPage> {
  Future<List<Post>> ? data;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    data=PostApiService().getPost();
  }
  Widget build(BuildContext context) {
    return MaterialApp(
      //debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(onPressed: (){Navigator.pop(context);},
              icon: Icon(Icons.arrow_back_ios_new,color: Colors.white,)),
          title: Text("Time line",style: TextStyle(color: Colors.white),),
          backgroundColor: Color(0xFFE1306C),
        ),
        body: FutureBuilder(
            future: data,
            builder: (context,snapshot){
              if(snapshot.hasData && snapshot.data!.isNotEmpty)
              {
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context,index){
                      return Card(
                        color: Color(0xFFF1CAD5),
                        child: Column(
                          children: [
                            ListTile(
                              leading: CircleAvatar(
                                radius: 35,
                                child: Text(snapshot.data![index].userId.name[0],style: TextStyle(fontSize: 24),),
                                backgroundColor: Colors.white,
                              ),
                              title: Text(snapshot.data![index].userId.name),
                             subtitle: Text(snapshot.data![index].userId.address+ "\n"
                                  + snapshot.data![index].userId.mobile+
                                 "\n"+snapshot.data![index].postedDate.toIso8601String()
                              ),
                            ),
                            Row(
                              children: [
                                SizedBox(height: 15,),
                                SizedBox(width: 20,),
                                Text(snapshot.data![index].post,style: TextStyle(fontSize: 20,),),
                              ],
                            ),
                            //Image.network(snapshot.data![index].post),
                            SizedBox(height: 10,),
                          ],
                        ),
                      );
                    });
              }
              else
              {
                return CircularProgressIndicator();
              }
            }),

      ),
    );
  }
}
