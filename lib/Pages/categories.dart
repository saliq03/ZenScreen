import 'package:flutter/material.dart';
import 'package:zenscreen/Pages/All_Wallpaper.dart';

class Categories extends StatefulWidget {


  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Center(
                child: Text("Categories",style: TextStyle(fontFamily: "Poppins",fontWeight: FontWeight.bold,fontSize: 30,color: Colors.black),)),
            SizedBox(height: 10,),
            MyCategory("assets/images/city.jpeg", "City"),
            MyCategory("assets/images/nature.jpeg", "Nature"),
            MyCategory("assets/images/wildlife.jpeg", "Wildlife"),
            MyCategory("assets/images/food.jpeg", "Food"),

        
          ],
        ),
      ),
    );
  }

  MyCategory(String image,String title){
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>AllWallpaper(Category: title)));
      },
      child: Container(
        padding: EdgeInsets.only(bottom: 20),
        child: Stack(
          children: [
            ClipRRect(borderRadius: BorderRadius.circular(22),
              child: Image.asset(image,
                width: MediaQuery.of(context).size.width,
                height: 180,
                fit: BoxFit.cover,),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 180,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22),
                color: Colors.black26,
              ),
              child:Center(
                  child: Text(title,style: TextStyle(fontFamily: "Poppins",fontWeight: FontWeight.bold,fontSize: 35,color: Colors.white),)),
            )
          ],
        ),
      ),
    );
  }
}
