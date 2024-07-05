import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class AllWallpaper extends StatefulWidget {
  final String Category;
  AllWallpaper({required this.Category})

  @override
  State<AllWallpaper> createState() => _AllWallpaperState();
}

class _AllWallpaperState extends State<AllWallpaper> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.Category,style:TextStyle(fontSize: 30,fontFamily: "Poppins",fontWeight: FontWeight.bold),),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),

      body: StreamBuilder(
        stream:FirebaseFirestore.instance.collection(widget.Category).snapshots(),
          builder: (context,snapshot){
           return GridView.builder(
              itemCount: snapshot.data!.docs.length,
              gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 6,
                  mainAxisSpacing: 6,
                  childAspectRatio: 0.6),
              itemBuilder: (context,index){
               DocumentSnapshot ds=snapshot.data!.docs[index];
                return  Container(
                        child: Image.network(ds["Image"],fit: BoxFit.cover,)
                      );
              });
          }

      )
    );
  }
}
