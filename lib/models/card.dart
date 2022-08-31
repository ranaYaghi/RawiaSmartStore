class PaymentCard {
  late int id;
  late String name;





  static final String table = "cards";

  PaymentCard({required this.name , required this.id});
  PaymentCard.fromMap(Map<String, dynamic>rowMap){
    id = rowMap['id'];
    name = rowMap['name'];




  }


}