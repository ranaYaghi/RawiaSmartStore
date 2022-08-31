



import 'package:flutter/material.dart';

import '../models/card.dart' ;

class CardProvider extends ChangeNotifier {


  List<PaymentCard> cards = <PaymentCard>[


    PaymentCard(name: 'qwe', id: 1),
    PaymentCard(name: 'qwed', id: 2)
  ];


}