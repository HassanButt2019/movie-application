class MovieModel{
  int id;
  String title;
  String imgurl;
  String overview;




  MovieModel.fromJson(Map<String,dynamic> json)
  {
    print("HELLO in movie model");
    id = json['id'];
    title = json['title'];
    imgurl = json['poster_path'];
    overview = json['overview'];
  }

}