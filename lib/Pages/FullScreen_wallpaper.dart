import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

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
              child: CachedNetworkImage(imageUrl: widget.imagepath,fit: BoxFit.cover,),
            ),)
        ],
      ),
    );
  }
}
