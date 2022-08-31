import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utilities/style_constants.dart';



class OnBoardingContent extends StatelessWidget {
  const OnBoardingContent({
    Key? key,

    required this.title,
    required this.subTitle
  }) : super(key: key);


  final String title;
  final String subTitle;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [

        Align(

            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 150),
              child: Text(subTitle ,  style: GoogleFonts.breeSerif(
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
                fontStyle: FontStyle.italic,
                fontSize: 13.sp,
                color: StyleConstants.secondColor,)),
            )),
        Align(

          alignment: Alignment.center,
          child: Padding(

            padding: EdgeInsets.symmetric(
                horizontal: 15.w, vertical: 15.h),
            child: Text(
              title,
              style: GoogleFonts.breeSerif(
                fontWeight: FontWeight.bold,
                fontSize: 35.sp,
                color: StyleConstants.secondColor,
              ),
            ),
          ),
        ),

      ],
    );
  }
}


