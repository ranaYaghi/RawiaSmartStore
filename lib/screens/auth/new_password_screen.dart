import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_store/utilities/style_constants.dart';
import 'package:smart_store/widgets/app_text_field.dart';

class NewPassword extends StatefulWidget {
  const NewPassword({Key? key}) : super(key: key);

  @override
  State<NewPassword> createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {

  late TextEditingController _newPasswordTextController;
  late TextEditingController _oldPasswordTextController;
  late TextEditingController _confirmPasswordTextController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _newPasswordTextController = TextEditingController();
    _confirmPasswordTextController = TextEditingController();
    _oldPasswordTextController = TextEditingController();

  }

  @override
  void dispose() {
    // TODO: implement dispose

    _newPasswordTextController.dispose();
    _confirmPasswordTextController.dispose();
    _oldPasswordTextController.dispose();
    super.dispose();
  }

  String? _oldErrorValue;
  String? _newErrorValue;
  String? _confirmErrorValue;

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
            Text('Reset ',
                style: GoogleFonts.breeSerif(
                    fontSize: 30.sp, color: StyleConstants.thirdColor)),
            Text('Your Password Now!',
                style: GoogleFonts.breeSerif(
                    fontSize: 30.sp, color: StyleConstants.thirdColor)),
            SizedBox(
              height: 100,
            ),

            AppTextField(
              obscureText: true,
              hint: 'Old password',
              errorString: _oldErrorValue,
              prefixIcon: Icons.lock,
              controller: _oldPasswordTextController,

            ),
            SizedBox(
              height: 20,
            ),

            AppTextField(
              obscureText: true,
              hint: 'New password',
              errorString: _newErrorValue,
              prefixIcon: Icons.lock,
              controller: _newPasswordTextController,

            ),
            SizedBox(
              height: 20,
            ),
            AppTextField(
              obscureText: true,
              hint: 'Confirm password',
              errorString: _confirmErrorValue,
              prefixIcon: Icons.lock,
              controller: _confirmPasswordTextController,

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
                  'Save',
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
    if (

    _newPasswordTextController.text.isNotEmpty &&
    _oldPasswordTextController.text.isNotEmpty &&
    _confirmPasswordTextController.text.isNotEmpty

    ) {
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


      _newErrorValue =_newPasswordTextController.text.isEmpty ? 'Enter new password' : null;
      _confirmErrorValue =_confirmPasswordTextController.text.isEmpty ? 'Enter confirm password' : null;
      _oldErrorValue = _oldPasswordTextController.text.isEmpty ?'Enter old password' : null;
    });
  }

  void sendCode() {
   Navigator.pushReplacementNamed(context, '/bottom_navigation_screen');
  }
}
