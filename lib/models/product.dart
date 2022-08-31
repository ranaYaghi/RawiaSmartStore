
    class Product {
    late int id;
    late String name;
    late double price;
    late double rate;
    late String image;
    late int subcategory_id;


    static final String table = "products";

    Product({required this.name , required this.image , required this.id , required this.price});

    Product.fromMap(Map<String, dynamic>rowMap){
    id = rowMap['id'];
    image = rowMap['image'];
    name = rowMap['name'];
    price = rowMap['price'];
    rate = rowMap['rate'];
    subcategory_id = rowMap['subcategory_id'];

    }


    }