import 'dart:typed_data';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';

class FullscreenWallpaper extends StatefulWidget {
 final  String imagepath;
 FullscreenWallpaper({required this.imagepath});


  @override
  State<FullscreenWallpaper> createState() => _FullscreenWallpaperState();
}

class _FullscreenWallpaperState extends State<FullscreenWallpaper> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Hero(tag:widget.imagepath,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: widget.imagepath.contains("assets/images/")?Image.asset(widget.imagepath,fit: BoxFit.cover,):
              CachedNetworkImage(imageUrl: widget.imagepath,
                placeholder: (context, url) => Center(child: Container(height:50, child: CircularProgressIndicator())),
                fit: BoxFit.cover,)
            ),),
          GestureDetector(
            onTap: (){
              widget.imagepath.contains("assets/images/")?
              SaveLocalImage(): SaveImage();
            },
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20,vertical: 15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      border: Border.all(color: Colors.white54,width: 1),
                      color: Colors.black.withOpacity(0.4)
                    ),
                    child:(Text("Download Image",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontFamily: "Poppins",fontSize: 23),))
                  ),
                  SizedBox(height: 20,),

                  GestureDetector(
                    onTap: (){
                      Navigator.pop(context);
                    },
                      child: Text("Cancel",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontFamily: "Poppins",fontSize: 30))),
                  SizedBox(height: 50,)

                ],),
            ),
          )],),);
  }
  SaveImage() async {
    var response = await Dio().get(widget.imagepath,
        options: Options(responseType: ResponseType.bytes));
    final result = await ImageGallerySaver.saveImage(Uint8List.fromList(response.data),
        );
    print(result);
    Navigator.pop(context);
  }
  SaveLocalImage() async {
    final ByteData byteData = await rootBundle.load(widget.imagepath);
    final Uint8List bytes = byteData.buffer.asUint8List();
    final result = await ImageGallerySaver.saveImage(bytes);
    print(result);
    Navigator.pop(context);
  }
}
