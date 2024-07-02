import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return  Container(
        margin: EdgeInsets.only(top:60,left: 20,right: 20),
        child: Column(
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(35),
                    child: Image.asset("assets/images/profile.png",width: 70,height: 70,fit: BoxFit.cover,)),
                SizedBox(width: 40,),
                Center(child: Text("ZenScreen",style: TextStyle(fontFamily: "Poppins",fontWeight: FontWeight.bold,fontSize: 30),))
              ],
            ),
            SizedBox(height: 10,),
            ClipRRect(borderRadius: BorderRadius.circular(30),
              child: Image.asset("assets/images/sample.png",
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height*0.7,
              fit: BoxFit.cover,),
            )
          ],
        ),

    );
  }
}
