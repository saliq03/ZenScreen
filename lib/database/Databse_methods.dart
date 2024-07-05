import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
class DatabseMethods{

 Future addWallpaper(String img,String category,String id,) async {
    return await FirebaseFirestore.instance
        .collection(category)
        .doc(id)
        .set({
      "Id":id,
      "Image":img
    });
  }
}