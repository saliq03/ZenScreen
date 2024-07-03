class Photosmodel{
  String? url;
  SrcModel? src;
  Photosmodel({this.url, this.src});
  factory Photosmodel.fromMap(Map<String,dynamic>PhotoJson){
    return Photosmodel(
       url: PhotoJson["url"],
        src:SrcModel.fromMap(PhotoJson["src"]));
  }
}

class SrcModel{
  String? portrait;
  String? large;
  String? landscape;
  String? medium;

  SrcModel(this.portrait, this.large, this.landscape, this.medium);
  factory SrcModel.fromMap(Map<String ,dynamic>srcJson){
  return SrcModel(srcJson["portrait"], srcJson["large"], srcJson["landscape"], srcJson["medium"]);
  }
}