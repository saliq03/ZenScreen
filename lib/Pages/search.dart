import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:zenscreen/Widgets/widgets.dart';
import '../Models/PhotosModel.dart';
import 'package:http/http.dart'as http;

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController searchController=TextEditingController();
   List<Photosmodel> photos=[];

   @override
  void initState() {
    super.initState();
    getAllPhotos();
  }
   getAllPhotos() async {
     String searchtext='all';
     if(searchController.text!=''){
      searchtext=searchController.text;}
   try {
     await http.get(
         Uri.parse("https://api.pexels.com/v1/search?query=${searchtext}&per_page=30"),
         headers: {
           "Authorization": "ARK1n0oeShbY7IUDk0q7Zw6dru0JL0voylzJwOTKHboJmMeOOiZnr6pq"
         }).then((value) {
       Map<String, dynamic> jsonData = jsonDecode(value.body);
       jsonData["photos"].forEach((element) {
         Photosmodel photosmodel = new Photosmodel();
         photosmodel = Photosmodel.fromMap(element);
         photos.add(photosmodel);
         setState(() {});
       });
     });
   }
   catch(ex){
     print("Error found");
     print(ex.toString());
   }

   }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
        Center(child: Text("Search",style: TextStyle(fontFamily: "Poppins",fontWeight: FontWeight.bold,fontSize: 30,color: Colors.black))),
          SizedBox(height: 10,),
          Container(
            padding: EdgeInsets.only(left: 10,top: 5,bottom: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(11),
              color: Color(0xFFececf8)
            ),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: "search",
                suffixIcon: IconButton(onPressed: () {
                  photos=[];
                  FocusScope.of(context).unfocus();
                  getAllPhotos();
                },icon:Icon(Icons.search)),
                border: InputBorder.none

              ),
            ),
          ),
          SizedBox(height: 10,),
          Expanded(child: Container(child: onSearchImage(photos, context)))
        ],
      ),
    );
  }
}
