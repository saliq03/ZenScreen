import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
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
              decoration: InputDecoration(
                hintText: "search",
                suffixIcon: IconButton(onPressed: () {  },icon:Icon(Icons.search)),
                border: InputBorder.none

              ),
            ),
          )
        ],
      ),
    );
  }
}
