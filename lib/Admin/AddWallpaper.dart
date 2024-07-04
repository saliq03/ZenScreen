import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';

class Addwallpaper extends StatefulWidget {
  const Addwallpaper({super.key});

  @override
  State<Addwallpaper> createState() => _AddwallpaperState();
}

class _AddwallpaperState extends State<Addwallpaper> {
  File? pickedImage;
  @override
  Widget build(BuildContext context) {

    PickImage() async {
      try {
        final img = await ImagePicker().pickImage(source: ImageSource.gallery);
        if(img==null)return;
        final tempimg=File(img.path);
        setState(() {
          pickedImage=tempimg;
        });}
      catch(ex){
        print(ex.toString());
      }
    }
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Add Wallpaper"),
        centerTitle: true,
        backgroundColor: Color(0xFFededeb),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 50,left: 20,right:20 ),
        child: Column(
         crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: (){
                PickImage();
              },
              child: Container(
                width: 230,
                height: 300,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 2,
                    color: Colors.black
                  ),
                  borderRadius:BorderRadius.circular(22)
                ),
                child:pickedImage==null? Center(
                  child: Icon(Icons.camera_alt_outlined,color: Colors.black,size: 30,),
                ): ClipRRect(borderRadius: BorderRadius.circular(22),
                    child: Image.file(pickedImage!,width: 230,height: 300,fit: BoxFit.cover,)),
              ),
            ),

            GestureDetector(
              onTap: (){

              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                margin: EdgeInsets.only(top: 40,bottom: 10),
                width:MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.black
                ),
                child: Center(child: Text("LogIn",
                  style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold),)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
