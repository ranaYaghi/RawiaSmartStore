
class Subcategory {
  late int id;
  late String name;
  late String image;
  late int subcategory_id;



  static final String table = "subcategories";

  Subcategory();

  Subcategory.fromMap(Map<String, dynamic>rowMap){
    id = rowMap['id'];
    name = rowMap['name'];
    image = rowMap['image'];

    subcategory_id = rowMap['subcategory_id'];

  }


}