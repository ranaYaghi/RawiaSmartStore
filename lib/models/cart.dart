class Cart {
  late int id;
  late double total;
  late double price;
  late int count;
  late int userId;
  late String image;
  late int productId;
  late String productName;

  static const String tableName = 'cart';

  Cart({required this.id , required this.total ,required this.image,required this.count , required this.price , required this.productName });

  Cart.fromMap(Map<String, dynamic> rowMap) {
   id = rowMap['id'];
   total = rowMap['total'];
   price = rowMap['price'];
   count = rowMap['count'];
   userId = rowMap['user_id'];
   productId = rowMap['product_id'];
   productName = rowMap['name'];
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = <String, dynamic>{};
    map['total'] = total;
    map['price'] = price;
    map['count'] = count;
    map['user_id'] = userId;
    map['product_id'] = productId;
    return map;
  }
}