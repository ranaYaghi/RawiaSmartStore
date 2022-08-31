import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_store/utilities/style_constants.dart';

class VerificationEditMobileScreen extends StatefulWidget {
  const VerificationEditMobileScreen({Key? key}) : super(key: key);

  @override
  State<VerificationEditMobileScreen> createState() => _VerificationEditMobileScreenState();
}

class _VerificationEditMobileScreenState extends State<VerificationEditMobileScreen> {
  bool _onEditing = true;
  String? _code;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: StyleConstants.mainColor,
      body: ListView(
        children: [
          Column(
            children: [
              Image(
                image: AssetImage('images/clothing_logo_1.png'),
                height: 150.h,
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 20.0.h),
                child: Center(
                  child: Text(
                    'Enter your code',
                    style: GoogleFonts.breeSerif(
                      fontSize: 20.0.sp,
                    ),
                  ),
                ),
              ),
              VerificationCode(
                textStyle: TextStyle(fontSize: 15.sp),
                fullBorder: true,
                itemSize: 50,
                autofocus: true,
                fillColor: StyleConstants.secondColor,
                keyboardType: TextInputType.number,
                underlineColor: StyleConstants.secondColor,
                // If this is null it will use primaryColor: Colors.red from Theme
                length: 4,

                cursorColor: StyleConstants.secondColor,
                // If this is null it will default to the ambient
                // clearAll is NOT required, you can delete it
                // takes any widget, so you can implement your design
                clearAll: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'clear all',
                    style: GoogleFonts.breeSerif(
                      decoration: TextDecoration.underline,
                        fontSize: 14.0.sp, color: StyleConstants.secondColor ,),
                  ),
                ),
                onCompleted: (String value) {
                  setState(() {
                    _code = value;
                  });

                  Navigator.of(context).pushNamedAndRemoveUntil(
                      '/bottom_navigation_screen', (Route<dynamic> route) => false);
                },
                onEditing: (bool value) {
                  setState(() {
                    _onEditing = value;
                  });
                  if (!_onEditing) FocusScope.of(context).unfocus();
                },
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Center(
                  child: _onEditing
                      ? Text('Please enter full code')
                      : Text('Your code: $_code'),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
