import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:zenscreen/Pages/categories.dart';
import 'package:zenscreen/Pages/search.dart';

import 'home.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int currentIndex=0;

  late List<Widget> pages;
  late Home home;
  late Search search;
  late Categories categories;
  @override
  void initState() {
    home=Home();
    search=Search();
    categories=Categories();
    pages=[home,search,categories];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Padding(
        padding: EdgeInsets.only(top:60,left: 20,right: 20),
        child: pages[currentIndex],),
      bottomNavigationBar: CurvedNavigationBar(
        items: [
          Icon(Icons.home_outlined,color: Colors.white,),
          Icon(Icons.search_outlined,color: Colors.white,),
          Icon(Icons.category_outlined,color: Colors.white,),
        ],
        buttonBackgroundColor: Colors.black,
        backgroundColor: Colors.white,
        color: Colors.black54,
        height: 65,
        animationDuration: Duration(milliseconds: 500),
        onTap: (index){
          setState(() {
            currentIndex=index;
          });
        },

      ),

    );
  }
}
