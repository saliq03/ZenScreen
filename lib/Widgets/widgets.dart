import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/widgets.dart';

import 'package:zenscreen/Models/PhotosModel.dart';
import 'package:zenscreen/Pages/FullScreen_wallpaper.dart';

Widget onSearchImage(List<Photosmodel> photos,BuildContext context){
  return GridView.builder(
     itemCount: photos.length,
      gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
      crossAxisSpacing: 6,
      mainAxisSpacing: 6,
      childAspectRatio: 0.6),
      itemBuilder: (context,index){
        return GestureDetector(
          onTap: () {
            print(photos[index].src!.portrait!);
            Navigator.push(context, MaterialPageRoute(builder: (context) =>
                FullscreenWallpaper(imagepath: photos[index].src!.portrait!)));
          },
          child: GridTile(
              child:Hero(tag:photos[index].src!.portrait!,
              child: Container(
                child: CachedNetworkImage(imageUrl: photos[index].src!.portrait!,fit: BoxFit.cover,),
              ),)
          ),
        );
      });
}

Widget loginBlackPannel( BuildContext context){
  return  Align(
    alignment:  Alignment.bottomCenter,
    child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height/2,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [Color.fromARGB(255,53,51,51),Colors.black],
              begin: Alignment.topLeft,end: Alignment.bottomRight,),
            borderRadius: BorderRadius.vertical(
                top:Radius.elliptical(
                    MediaQuery.of(context).size.width, 120) )
        ))               ,
  );
}


