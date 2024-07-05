import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class Addwallpaper extends StatefulWidget {
  const Addwallpaper({super.key});

  @override
  State<Addwallpaper> createState() => _AddwallpaperState();
}

class _AddwallpaperState extends State<Addwallpaper> {
  File? pickedImage;
  String? dropdownValue;
  List<String> dropdownitems=["Wildlife","Food","City","Nature"];

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
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Add Wallpaper",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontFamily: "Poppins"),),
        centerTitle: true,
        backgroundColor: Color(0xFFededeb),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 50,left: 20,right:20 ),
        child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: GestureDetector(
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
            ),
            SizedBox(height: 20,),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(horizontal:10),
              decoration: BoxDecoration(
                  color: Color(0xFFececf8),
                borderRadius: BorderRadius.circular(11)
              ),
              child: DropdownButton(
                value: dropdownValue,
                  hint: Text("Select Category"),
                  icon: Icon(Icons.arrow_drop_down ,),
                  underline: SizedBox.shrink(),
                  padding: EdgeInsets.only(left: 10),
                  style: TextStyle(fontSize: 20,color: Colors.black),
                  onChanged: (value){
                  dropdownValue=value;
                  setState(() {});
                  },


                  items: dropdownitems.map((element){
                   return DropdownMenuItem(child:  Text(element),value: element,);
                  }).toList(),

               selectedItemBuilder: (BuildContext context) {
                 return dropdownitems
                     .map((String value) {
                   return Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       Text(value),
                       SizedBox(width: MediaQuery.of(context).size.width*0.57,),
                     ],
                   );
                 }).toList();
               }
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
            ),
          ],
        ),
      ),
    );
  }
}
