import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:smart_store/screens/app/product_subcategory_screen.dart';
import 'package:smart_store/utilities/style_constants.dart';

import '../../providers/product_provider.dart';
import '../../widgets/product_card.dart';

class SubCategoryScreen extends StatefulWidget {
  const SubCategoryScreen({Key? key, required this.categoryId})
      : super(key: key);
  final int categoryId;

  @override
  State<SubCategoryScreen> createState() => _SubCategoryScreenState();
}

class _SubCategoryScreenState extends State<SubCategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(

          iconTheme: IconThemeData(
              color: StyleConstants.thirdColor
          ),
          title: Text('Category Name', style: GoogleFonts.breeSerif(
              color: StyleConstants.thirdColor
          ),

          ),

          titleSpacing: 0,
        ),
        body: GridView.builder(

       padding: EdgeInsets.all( 10.h ),
          scrollDirection: Axis.vertical,
          itemCount: 20,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,

            childAspectRatio: 60 / 30,


          ),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: (){

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  ProductSubcategoryScreen(SubcategoryId:5
                  )),
                );
              },
              child: Card(
                  color: Colors.grey[300],
                elevation: 4,
                shadowColor:StyleConstants.thirdColor ,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Row(

                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: Text('subcategory' , style: GoogleFonts.breeSerif(
                          fontSize: 10
                        ),),
                      ),

                      CircleAvatar(

                        backgroundImage:AssetImage('images/prod2.webp') ,
                        radius: 30,
                      ),


                    ],
                  ),
                ),
              ),
            );
          },
        )

    );
  }
}
