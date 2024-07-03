import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:zenscreen/Models/PhotosModel.dart';

Widget onSearchImage(List<Photosmodel> photos,BuildContext context){
  return GridView.builder(
     itemCount: photos.length,
      gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
      crossAxisSpacing: 6,
      mainAxisSpacing: 6,
      childAspectRatio: 0.6),
      itemBuilder: (context,index){
        return GridTile(
            child:Hero(tag:photos[index].src!.portrait!,
            child: Container(
              child: CachedNetworkImage(imageUrl: photos[index].src!.portrait!,fit: BoxFit.cover,),
            ),)
        );
      });
}