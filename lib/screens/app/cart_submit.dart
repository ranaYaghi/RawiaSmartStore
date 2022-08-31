import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utilities/style_constants.dart';

class CartSubmit extends StatefulWidget {
  const CartSubmit({Key? key}) : super(key: key);

  @override
  State<CartSubmit> createState() => _CartSubmitState();
}

class _CartSubmitState extends State<CartSubmit> {
  String? _type;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: StyleConstants.thirdColor, size: 30),
          centerTitle: true,
          title: Text('Submit ',
              style: GoogleFonts.breeSerif(
                  fontSize: 18, color: StyleConstants.thirdColor)),
        ),
        body: Card(
          elevation: 5,

          margin: EdgeInsets.all(10),

          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Spacer(),
                Row(children: [
                  Text('Selected Address:',
                      style: GoogleFonts.breeSerif(
                          fontSize: 16, color: StyleConstants.thirdColor)),
                  Text(' Gaza',
                      style: GoogleFonts.breeSerif(
                          fontSize: 18, color: Colors.grey[500]))
                ]),
                SizedBox(height: 10.h,),

                Text(
                  'Select payment Type:',
                  style: GoogleFonts.breeSerif(

                    color: StyleConstants.thirdColor
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: RadioListTile<String>(
                        title: Text('Cash', style: GoogleFonts.breeSerif()),
                        value: 'Cash',
                        activeColor: StyleConstants.thirdColor,
                        groupValue: _type,
                        onChanged: (String? value) {
                          setState(() => _type = value);
                        },
                      ),
                    ),
                    Expanded(
                      child: RadioListTile<String>(
                        title: Text('Online', style: GoogleFonts.breeSerif()),
                        value: 'Online',
                        activeColor: StyleConstants.thirdColor,
                        groupValue: _type,
                        onChanged: (String? value) {
                          setState(() => _type = value);
                        },
                      ),
                    )
                  ],
                ),

                Spacer(),
                ElevatedButton(

                    onPressed: (){
                      Navigator.pushNamed(context, '');
                    },
                    style: ElevatedButton.styleFrom(


                        primary: StyleConstants.thirdColor,
                        minimumSize: Size(double.infinity, 50.h),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.r))),
                    child: Text(
                      'Send Order',
                      style: GoogleFonts.breeSerif(letterSpacing: 3),
                    )),
              ],
            ),
          ),
        ));
  }
}
