import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/widgets.dart';
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

 textfieldDecoration(String hinttext){
  return InputDecoration(
    hintText: hinttext,
    contentPadding:  EdgeInsets.symmetric(horizontal: 20,vertical: 20),
    enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(22),
        borderSide: BorderSide(
            width: 2,color: Colors.black38
        )),
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(22),
        borderSide: BorderSide(
            width: 2,color: Colors.black38
        )),
    errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(22),
        borderSide: BorderSide(
            width: 2,color: Colors.redAccent
        )),
    focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(22),
        borderSide: BorderSide(
            width: 2,color: Colors.black38
        )),

  );
 }
