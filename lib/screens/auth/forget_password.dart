import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_store/utilities/style_constants.dart';
import 'package:smart_store/widgets/app_text_field.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  late TextEditingController _emailTextController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _emailTextController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _emailTextController.dispose();
    super.dispose();
  }

  String? _emailErrorValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: StyleConstants.mainColor,
      appBar: AppBar(
        titleSpacing: 0,
        title: Text(
          'back',
          style: GoogleFonts.breeSerif(
              fontSize: 15.sp, color: StyleConstants.thirdColor),
        ),
      ),
      body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
          children: [
            Text('Recover ',
                style: GoogleFonts.breeSerif(
                    fontSize: 30.sp, color: StyleConstants.thirdColor)),
            Text('Your Account',
                style: GoogleFonts.breeSerif(
                    fontSize: 30.sp, color: StyleConstants.thirdColor)),
            SizedBox(
              height: 100,
            ),
            AppTextField(
              hint: 'Enter your email or phone number',
              errorString: _emailErrorValue,
              prefixIcon: Icons.email,
              controller: _emailTextController,

            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () => perfomForget(),
                style: ElevatedButton.styleFrom(
                    primary: StyleConstants.secondColor,
                    minimumSize: Size(double.infinity, 50.h),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.r))),
                child: Text(
                  'Send me Code',
                  style: GoogleFonts.breeSerif(letterSpacing: 3),
                ))
          ]),
    );
  }

  //performLogin - checkData => login (Single Responsibility) SOLID
  void perfomForget() {
    if (checkData()) {
      sendCode();
    }
  }

  bool checkData() {
    if (_emailTextController.text.isNotEmpty) {
      _controlErrorValue();
      return true;
    }
    _controlErrorValue();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Error, enter required data!'),
        backgroundColor: Colors.red,
        duration: Duration(seconds: 3),
        dismissDirection: DismissDirection.horizontal,
      ),
    );
    return false;
  }

  void _controlErrorValue() {
    setState(() {
      _emailErrorValue =
          _emailTextController.text.isEmpty ? 'Enter password' : null;
    });
  }

  void sendCode() {
  Navigator.pushReplacementNamed(context, '/verification_screen');
  }
}
