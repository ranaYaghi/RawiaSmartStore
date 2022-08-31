import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_store/screens/app/details_screen.dart';
import 'package:smart_store/screens/app/home_screen.dart';

import '../models/product.dart';
import '../utilities/style_constants.dart';
class ProductCard extends StatelessWidget {
  const ProductCard({

    Key? key,
    required this.product
  }) : super(key: key);

  final Product product;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){


        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>  DetailsScreen(productId: 5,)
          ));

      },

      child: Card(
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

          ],
        ),
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
