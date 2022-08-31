

import 'package:flutter/material.dart';

import '../models/category.dart';

class CategoryProvider extends ChangeNotifier {


  List<Category> categories = <Category>[
    Category(id:1, name: 'Dresses & Abayas', image: 'images/category/d1.webp'),
    Category(id:2,name: 'Shoes', image: 'images/category/s1.webp'),
    Category(id:3, name: 'Hijabs', image: 'images/category/h1.webp'),
    Category(id:4, name: 'Plus Size', image: 'images/category/plus1.webp'),
    Category(id:5, name: 'Bags', image: 'images/category/bags1.webp'),
    Category(id: 6,name: 'Accessories', image: 'images/category/a1.webp'),
    Category(id: 7,name: 'Topwear', image: 'images/category/top1.webp'),
    Category(id:8 ,name: 'Outerwear', image: 'images/category/out1.webp'),
    Category(id:9 ,name: 'Beauty', image: 'images/category/b1.webp'),
    Category(id:10, name: 'Swimwear', image: 'images/category/swim1.webp'),


  ];


}