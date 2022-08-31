import 'package:flutter/material.dart';

import '../models/product.dart';


class FavouriteProvider extends ChangeNotifier {


  List<Product> Favs = <Product>[
    Product(image: 'images/prod4.jpg' , id: 1, price :5 , name :'prod1'),
    Product(image: 'images/prod1.jpg' , id: 1, price :5 , name :'prod1'),
    Product(image: 'images/prod2.webp' , id: 2, price :5 , name :'prod1'),
    Product(image: 'images/prod3.webp' , id: 3, price :5 , name :'prod1'),
    Product(image: 'images/prod4.webp' , id: 4, price :5 , name :'prod1'),
    Product(image: 'images/prod5.webp' , id: 4, price :5 , name :'prod1'),
    Product(image: 'images/prod6.webp' , id: 4, price :5 , name :'prod1'),
    Product(image: 'images/prod7.webp' , id: 5, price :5 , name :'prod1'),
    Product(image: 'images/prod8.webp' , id: 5, price :5 , name :'prod1'),
    Product(image: 'images/prod9.webp' , id: 5, price :5 , name :'prod1'),


  ];


}