import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:zenscreen/Admin/login.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List wallpaperImage=["assets/images/nature.jpeg","assets/images/food.jpeg","assets/images/wildlife.jpeg","assets/images/city.jpeg","assets/images/sample.png","assets/images/profile.png"];
 int activeindex=0;

  @override
  Widget build(BuildContext context) {
    return  Container(
        child: Column(
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));},
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
                return buildImage(wallpaperImage[index]);
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
      child: Image.asset(image,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height/1.5,
        fit: BoxFit.cover,),
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
}
