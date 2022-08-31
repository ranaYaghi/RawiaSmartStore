import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductSliderContent extends StatelessWidget {
  const ProductSliderContent({
    Key? key,
    required this.image,

  }) : super(key: key);

  final String image;


  @override
  Widget build(BuildContext context) {
    return
        Image.asset(
          'images/$image',
          height: 317,
        );



  }
}
