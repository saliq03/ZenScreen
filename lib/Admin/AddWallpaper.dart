import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:random_string/random_string.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zenscreen/Admin/login.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:zenscreen/Pages/home.dart';
import '../database/Databse_methods.dart';

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
      if (img == null) return;
      final tempimg = File(img.path);
      CompressImage(tempimg);
    }
    catch(ex){
      print(ex.toString());
    }
  }

  UploadItem() async {
    if(pickedImage!=null &&dropdownValue!=null){
  String id=randomAlphaNumeric(10);
    FirebaseStorage storage =FirebaseStorage.instanceFor(bucket: "zenscreen-e56f6.appspot.com");
    TaskSnapshot snapshot=await storage.ref("Wallpapers").child(id).putFile(pickedImage!);
    String imageUrl= await snapshot.ref.getDownloadURL();
    await DatabseMethods().addWallpaper(imageUrl, dropdownValue!, id).then((value){
      Fluttertoast.showToast(
          msg: "Added Sucessfully",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0
      );
      pickedImage=null;
      setState(() {});
    });
    }
  }

   CompressImage(File file) async {
    var compressedImage=await FlutterImageCompress.compressAndGetFile(
      file.absolute.path,
      '${file.absolute.parent.path}/temp.jpg',
      minHeight: 500,
      minWidth: 500,
      quality: 80);
    pickedImage= File(compressedImage!.path);
    setState(() {});
   }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Add Wallpaper",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontFamily: "Poppins"),),
        centerTitle: true,
        backgroundColor: Color(0xFFededeb),
        actions: [IconButton(onPressed: () async {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Login()));
          SharedPreferences pref=await SharedPreferences.getInstance();
          pref.setBool(HomeState.loginkey, false);
        }, icon: Icon(Icons.logout))],
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
                UploadItem();
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                margin: EdgeInsets.only(top: 40,bottom: 10),
                width:MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.black
                ),
                child: Center(child: Text("Add",
                  style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold),)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
