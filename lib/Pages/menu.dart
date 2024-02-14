import 'package:blog_app/Pages/add_page.dart';
import 'package:blog_app/Pages/view_page.dart';
import 'package:flutter/material.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  final List<Widget> pages=[
    AddPage(),
    ViewPage(),
    ViewPage()
  ];
  int currentIndex=0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Menu page"),
        ),
        body: pages[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          onTap: (index){
            print(index);
            setState(() {
              currentIndex=index;
            });
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.add),
              label: "Add Post"
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.view_comfy_alt),
              label: "View All"
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.person),
            label: "View My Post"
            )
          ],
        ),
      ),
    );
  }
}
