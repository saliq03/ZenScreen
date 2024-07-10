import 'dart:math';

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:zenscreen/Admin/AddWallpaper.dart';
import 'package:zenscreen/Admin/login.dart';
import 'package:zenscreen/Pages/FullScreen_wallpaper.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => HomeState();
}

class HomeState extends State<Home> {
  List wallpaperImage=["assets/images/wallpaper1.jpg", "assets/images/wallpaper2.jpg",
    "assets/images/wallpaper3.jpg","assets/images/wallpaper4.jpg",
    "assets/images/wallpaper5.jpg", "assets/images/wallpaper6.jpg",
    "assets/images/wallpaper7.jpg","assets/images/wallpaper8.jpg",];
 int activeindex=0;

  static const String loginkey="loginkey";

 @override
  void initState() {
    wallpaperImage.shuffle(Random());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Container(
        child: Column(
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: (){
                    Navigate();
                     },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(35),
                      child: Image.asset("assets/images/profile.png",width: 70,height: 70,fit: BoxFit.cover,)),
                ),
                SizedBox(width: 40,),
                Center(
                    child: Text("ZenScreen",style: TextStyle(fontFamily: "Poppins",fontWeight: FontWeight.bold,fontSize: 30,color: Colors.black),))
              ],
            ),
            SizedBox(height: 10,),
            CarouselSlider.builder(
              itemCount: wallpaperImage.length,
              itemBuilder: (BuildContext context, int index, int realIndex) {
                return GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>FullscreenWallpaper(imagepath: wallpaperImage[index])));
                  },
                    child: buildImage(wallpaperImage[index]));
              },
              options: CarouselOptions(
                height: MediaQuery.of(context).size.height/1.5,
                enlargeCenterPage: true,
                viewportFraction: 1,
                enlargeStrategy: CenterPageEnlargeStrategy.height,
                autoPlay: true,
                onPageChanged: (index,reason){
                  setState(() {
                    activeindex=index;
                  });
                }
              ),),
            SizedBox(height: 10,),
            Center(child: buildIndicator(),)

          ],
        ),

    );
  }
  Widget buildImage(String image){
    return ClipRRect(borderRadius: BorderRadius.circular(40),
      child: Hero(tag: image,
        child: Image.asset(image,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height/1.5,
          fit: BoxFit.cover,),
      ),
    );


  }
  Widget buildIndicator(){
   return AnimatedSmoothIndicator(
       activeIndex: activeindex,
       count: wallpaperImage.length,
       effect: JumpingDotEffect(
         activeDotColor: Colors.blue,
         dotHeight:15,
         dotWidth: 15
       ),
   );
  }

  Future<void> Navigate() async {
   try {
     var pref = await SharedPreferences.getInstance();
     bool? isLoggedIn = pref.getBool(loginkey);

     if (isLoggedIn == true) {
       Navigator.push(
           context, MaterialPageRoute(builder: (context) => Addwallpaper()));
     }
     else {
       Navigator.push(
           context, MaterialPageRoute(builder: (context) => Login()));
     }
   }
   catch (ex){
     print(ex.toString());
   }

  }
}
