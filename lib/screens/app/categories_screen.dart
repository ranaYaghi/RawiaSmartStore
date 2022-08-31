
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:smart_store/models/category.dart';
import 'package:smart_store/providers/category_provider.dart';
import 'package:smart_store/screens/app/subcategories_screen.dart';

import '../../utilities/style_constants.dart';
class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Category> categories = Provider.of<CategoryProvider>(context).categories;
    return GridView.builder(
 padding: EdgeInsets.all(10),
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: categories.length ,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,

        childAspectRatio:40  / 50,

      ),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: (){
            //ToDo send categoryId to sub category screen
           // Navigator.push(context, MaterialPageRoute(builder:(context , ) ))

            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>  SubCategoryScreen(categoryId: categories[index].id
              )),
            );
          },
          child: Card(
            clipBehavior: Clip.antiAlias,
            elevation: 4,
       shape: RoundedRectangleBorder(
           borderRadius: BorderRadius.circular(10),
       ),
      child:  Stack(
        children:[ Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(categories[index].image) , fit: BoxFit.fill
              )
            ),
        ),
        PositionedDirectional(
         bottom: 5,
            start: 5,

            child: Text(categories[index].name , style: GoogleFonts.breeSerif(color: StyleConstants.thirdColor),))
        ]
      ),
          ),
        );
      },
    );
  }
}
