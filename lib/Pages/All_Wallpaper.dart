import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:zenscreen/Pages/FullScreen_wallpaper.dart';

class AllWallpaper extends StatefulWidget {
  final String Category;
  AllWallpaper({required this.Category});

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

      body: Expanded(
        child: Container(

          child: StreamBuilder(
            stream:FirebaseFirestore.instance.collection(widget.Category).snapshots(),
              builder: (context,snapshot){
              if(snapshot.connectionState==ConnectionState.active) {
                if(snapshot.hasData) {
                  return GridView.builder(
                      itemCount: snapshot.data!.docs.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 6,
                          mainAxisSpacing: 6,
                          childAspectRatio: 0.6),
                      itemBuilder: (context, index) {
                        DocumentSnapshot ds = snapshot.data!.docs[index];
                        return GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>FullscreenWallpaper(imagepath: ds["Image"])));
                          },
                          child: Hero(
                            tag: ds["Image"],
                            child: Container(
                                child: CachedNetworkImage(imageUrl: ds["Image"],
                                  placeholder: (context, url) => Center(child: Container(height:50, child: CircularProgressIndicator())),
                                  fit: BoxFit.cover,)
                            ),
                          ),
                        );
                      });
                }
                else if(snapshot.hasError){
                  print(snapshot.hasError);
                  return Center(child: Text("ERROR"),);
                }
                else{
                  return Center(child: Text("No data found",style: TextStyle(color: Colors.black),),);
                }
              }
              else{
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              }

          ),
        ),
      )
    );
  }
}
