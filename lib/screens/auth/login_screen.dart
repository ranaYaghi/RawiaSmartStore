
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_store/utilities/style_constants.dart';
import 'package:smart_store/widgets/app_text_field.dart';



class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {


  late TextEditingController _passwordTextController;
  late TextEditingController _phoneTextController;



  //errors value


  String? _passwordErrorValue;

  String? _phoneErrorValue;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _passwordTextController = TextEditingController();

    _phoneTextController = TextEditingController();



  }
  @override
  void dispose() {
    // TODO: implement dispose
   _passwordTextController.dispose();

    _phoneTextController.dispose();

    super.dispose();
  }


  void loginToYourAccount() {
    Navigator.pushNamed(context, '/login_screen');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(

      ),
      backgroundColor: StyleConstants.mainColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: ListView(

          children: [Image(image: AssetImage('images/clothing_logo_1.png')) ,



            AppTextField(hint: 'Mobile', errorString: _phoneErrorValue, keyboardType: TextInputType.phone, prefixIcon: Icons.phone , controller: _phoneTextController),
            SizedBox(height: 10,),

            // GENDER SECTION


            AppTextField(hint: 'password', errorString: _passwordErrorValue,obscureText: true, prefixIcon: Icons.lock , controller: _passwordTextController),
            TextButton(
              style: TextButton.styleFrom(
                alignment: AlignmentDirectional.centerEnd,
                padding: EdgeInsets.zero
              ),
              onPressed: (){

                Navigator.pushReplacementNamed(context ,'/forget_password_screen');
              },
              child: Text(
                'Forget Password?',
                style: GoogleFonts.breeSerif(
                    fontSize: 12.sp,
                  height: 0,
                    color: StyleConstants.thirdColor
                ),
              ),
            ),





            ElevatedButton(

                onPressed: ()=> perfomLogin(),
                style: ElevatedButton.styleFrom(
                    primary: StyleConstants.secondColor,
                    minimumSize: Size(double.infinity, 50.h),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.r))),
                child: Text(
                  'Login',
                  style: GoogleFonts.breeSerif(letterSpacing: 3),
                )),

            const SizedBox(height: 10),
      ],
        ),
      ),
    );
  }


  //performLogin - checkData => login (Single Responsibility) SOLID
  void perfomLogin() {
    if (checkData()) {
      login();
    }
  }

  bool checkData() {
    if (
        _passwordTextController.text.isNotEmpty && _phoneTextController.text.isNotEmpty ) {
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

      _passwordErrorValue =
      _passwordTextController.text.isEmpty ? 'Enter password' : null;


      _phoneErrorValue =_phoneTextController.text.isEmpty? 'Enter mobile' : null ;  });
  }

  void login() {
    Navigator.of(context).pushNamedAndRemoveUntil(
        '/bottom_navigation_screen', (Route<dynamic> route) => false);

  }

}



