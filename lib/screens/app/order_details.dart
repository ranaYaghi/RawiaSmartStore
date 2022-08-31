import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utilities/style_constants.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: StyleConstants.thirdColor, size: 30),
        centerTitle: true,
        title: Text('Order Details ',
            style: GoogleFonts.breeSerif(
                fontSize: 18, color: StyleConstants.thirdColor)),
        actions: [Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('#5' ,style: GoogleFonts.breeSerif(
              fontSize: 18, color: StyleConstants.thirdColor)),
        )],
      ),

      body: ListView(
        children: [

          Card(
            elevation: 5,
            margin: EdgeInsets.symmetric(horizontal: 10),
            shadowColor: StyleConstants.thirdColor,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                       mainAxisAlignment: MainAxisAlignment.center,
                    children: [Text('Total:', style: GoogleFonts.breeSerif(
                        fontSize: 18, color: StyleConstants.thirdColor)) , Text('500' ,  style: GoogleFonts.breeSerif(
                        fontSize: 18, color: Colors.grey.shade400))],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Text('Date:', style: GoogleFonts.breeSerif(
                        fontSize: 18, color: StyleConstants.thirdColor)) , Text('20/5/2022' ,  style: GoogleFonts.breeSerif(
                        fontSize: 18, color: Colors.grey.shade400))],
                  ),
                ),
              ],
            ),
          ),


          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Order Products:', style: GoogleFonts.breeSerif(
                fontSize: 18, color: StyleConstants.thirdColor)),
          ),
          ListView.builder(
             shrinkWrap: true,
           physics: NeverScrollableScrollPhysics(),
             itemCount: 2,
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
                       child: Image(image: AssetImage('images/prod4.webp' , )  ,

                         fit: BoxFit.fill,
                       ),


                       width:100, height: 110,),
                     Padding(
                       padding:  EdgeInsets.symmetric(horizontal: 15.h),
                       child: Column(

                         children: [Text('Jumpsuit' ,style: GoogleFonts.breeSerif(
                             fontSize: 18, ) ) , Text(

                             'َQuantity: 1' ,style: GoogleFonts.breeSerif(
                           fontSize: 12, )
                         )],

                       ),
                     ),




                   ],


                 )


             ),
           );
         }),

        ],
      ),
    );
  }
}
