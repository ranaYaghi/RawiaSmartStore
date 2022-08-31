import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../providers/favourite_provider.dart';
import '../../utilities/style_constants.dart';

class FavaouriteScreen extends StatelessWidget {
  const FavaouriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _favList = Provider.of<FavouriteProvider>(context).Favs;
    return ListView.builder(
      padding: EdgeInsets.all(10),
      itemCount: _favList.length,
      itemBuilder: (context , index){
        return Card(


          elevation: 4,
          shape:  RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),

          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child:
           Row(



                children: [

             Container(
             clipBehavior: Clip.antiAlias,
             decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(10),
               boxShadow: [
                 BoxShadow(
                   offset: Offset(2, 5),
                   blurRadius: 4,
                   color: Colors.black.withOpacity(0.3),
                 ),               ]

             ),
             child: Image(image: AssetImage(_favList[index].image , )  ,

               fit: BoxFit.fill,
             ),


                    width:100, height: 110,),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 15.h),
                    child: Column(

                      children: [Text(_favList[index].name) , Text(

                          _favList[index].price.toString()
                      )],

                    ),
                  ),

                  Spacer(),
                  CircleAvatar(

                      radius: 20,
                      backgroundColor: StyleConstants.mainColor,

                      child: IconButton(onPressed: (){}, icon:Icon( Icons.favorite) , color: StyleConstants.thirdColor,)


                  )

                ],


              )


            ),
        );
      },
    );
  }
}
