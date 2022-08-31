class Category {
  late int id;
  late String name;
  late String image;




  static final String table = "categories";

  Category({required this.name , required this.image  , required this.id});
  Category.fromMap(Map<String, dynamic>rowMap){
    id = rowMap['id'];
    name = rowMap['name'];
    image = rowMap['image'];



  }


}