import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_store/utilities/style_constants.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
            color: StyleConstants.thirdColor
        ),
       titleSpacing: 0,
        title: Text('Notification', style: GoogleFonts.breeSerif(
          color: StyleConstants.thirdColor , fontSize:  20    )
        )
        ,),
      body: ListView.builder(
        padding: EdgeInsets.all(10),
          itemCount: 20,
          itemBuilder: (context , index){

        return Card(

        elevation: 5,
        shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10)
        ),
        child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Title' , style: GoogleFonts.breeSerif(
                    color: StyleConstants.thirdColor , fontSize: 16
                  ),),
                  Text('5/1/2022')
                ],
              ),
              SizedBox(height: 10,),
              Text('content content content content content content content content')
            ],
          ),
        ),
        ),
        );

      }),
    );
  }
}
