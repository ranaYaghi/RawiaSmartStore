import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/product.dart';
import '../utilities/style_constants.dart';
class ProductAddToCartCard extends StatelessWidget {
  const ProductAddToCartCard({

    Key? key,
    required this.product
  }) : super(key: key);

  final Product product;
  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          Stack(children: [


            Image(
                image: AssetImage(
                    product.image)),
            PositionedDirectional(
              start : 5,
              top: 5,
              child: CircleAvatar(
                  radius: 20,
                  backgroundColor: StyleConstants.mainColor,

                  child: IconButton(onPressed: (){}, icon:Icon( Icons.favorite_outline) , color: Colors.red,)


              ),
            ),
          ]),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(product.name),
                Text(product.price.toString()),
              ],
            ),
          ),
          OutlinedButton(onPressed: (){},
              style: OutlinedButton.styleFrom(
                  backgroundColor: StyleConstants.thirdColor,
                  padding: EdgeInsets.symmetric(horizontal: 20.w)
              )
              ,child: Text('Add To Cart' , style: GoogleFonts.breeSerif(
                  color: StyleConstants.mainColor
              ),))
        ],
      ),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
