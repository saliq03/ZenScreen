import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zenscreen/Admin/AddWallpaper.dart';
import 'package:zenscreen/Widgets/widgets.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => LoginState();
}

class LoginState extends State<Login> {
  final GlobalKey<FormState> _formKey=GlobalKey<FormState>();
  TextEditingController usernameController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  bool showflag =true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFededeb),
      body:Container(
        padding: EdgeInsets.only(top: 50),
        child: Column(
          children: [
          Center(child: Text("Let's start with\nAdmin",style: TextStyle(fontFamily: "Poppins",fontSize: 30,fontWeight: FontWeight.bold,color: Colors.black),)),
          Expanded(
            child: Stack(
                children: [
                  loginBlackPannel(context),
                  Container(
                    margin: EdgeInsets.only(top: 20,right: 20,left: 20),
                    child: Material(
                      borderRadius: BorderRadius.circular(22),
                      elevation: 10,
                      child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height/2.2,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(22),
                        ),
                      child:Form(
                        key: _formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(height: 10,),
                             TextFormField(
                                  controller: usernameController,
                                    style: TextStyle(fontSize: 23),

                                  decoration: textfieldDecoration("Enter username"),
                                  validator: (value){
                                      if(value==null||value.isEmpty){
                                        return "Please enter username";
                                      }
                                  },
                                ),
                               SizedBox(height: 30,),
                               TextFormField(
                                  controller: passwordController,
                                  style: TextStyle(fontSize: 23),
                                    obscureText: showflag,
                                    decoration: textfieldDecoration("Enter password"),
                                  validator: (value){
                                    if(value==null||value.isEmpty){
                                      return "Please enter password";
                                    }
                                  },),
                            GestureDetector(
                              onTap: (){
                                _formKey.currentState!.validate();
                                 Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Addwallpaper()));
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                                margin: EdgeInsets.only(top: 40),
                                width:MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.black
                                ),
                                child: Center(child: Text("LogIn",
                                style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold),)),
                              ),
                            )
                          ],
                        ),
                      ))))
                ])),

          ]),




      ),);
  }

  textfieldDecoration(String hinttext){

    return InputDecoration(
      hintText: hinttext,
      suffixIcon: hinttext=="Enter password"?IconButton(onPressed: (){
        showflag=!showflag;
        setState(() {});
      },
          icon: showflag?Icon(CupertinoIcons.eye):Icon(CupertinoIcons.eye_slash)):null,
      
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
}
