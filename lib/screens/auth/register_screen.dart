import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_store/utilities/style_constants.dart';
import 'package:smart_store/widgets/app_text_field.dart';

import '../../models/country.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

 late TextEditingController _nameTextController;
 late TextEditingController _emailTextController;
 late TextEditingController _passwordTextController;
 late TextEditingController _phoneTextController;
 late TapGestureRecognizer _tapGestureRecognizer;

 String? _gender;

 int? _selectedCountryId;
 final List<Country> _countries = <Country>[
   const Country(id: 1, title: 'Palestine'),
   const Country(id: 2, title: 'Egypt'),
   const Country(id: 3, title: 'Moroco'),
   const Country(id: 4, title: 'Jordan'),
 ];

 //errors value

 String? _emailErrorValue;
 String? _passwordErrorValue;
 String? _nameErrorValue;
 String? _cityErrorValue;
 String? _phoneErrorValue;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _nameTextController = TextEditingController();
    _passwordTextController = TextEditingController();
    _emailTextController = TextEditingController();
    _phoneTextController = TextEditingController();
    _tapGestureRecognizer = TapGestureRecognizer()
      ..onTap = loginToYourAccount;

  }
  @override
  void dispose() {
    // TODO: implement dispose
    _emailTextController.dispose();
    _passwordTextController.dispose();
    _emailTextController.dispose();
    _phoneTextController.dispose();
    _tapGestureRecognizer.dispose();
    super.dispose();
  }


 void loginToYourAccount() {
  Navigator.pushNamed(context, '/login_screen');
 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: StyleConstants.mainColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: ListView(

          children: [Image(image: AssetImage('images/clothing_logo_1.png')) ,
          AppTextField(hint: 'Name', errorString: _nameErrorValue ,prefixIcon: Icons.person , controller: _nameTextController),
          SizedBox(height: 10,),

          AppTextField(hint: 'Email', errorString: _emailErrorValue, keyboardType: TextInputType.emailAddress, prefixIcon: Icons.email , controller: _emailTextController),
            SizedBox(height: 10,),
          AppTextField(hint: 'Mobile', errorString: _phoneErrorValue, keyboardType: TextInputType.phone, prefixIcon: Icons.phone , controller: _phoneTextController),
            SizedBox(height: 10,),

            // GENDER SECTION


            AppTextField(hint: 'password', errorString: _passwordErrorValue,obscureText: true, prefixIcon: Icons.lock , controller: _passwordTextController),
            SizedBox(height: 10,),
            Text(
              'Gender',
              style: GoogleFonts.breeSerif(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: RadioListTile<String>(
                    title: Text('Male', style: GoogleFonts.breeSerif()),
                    value: 'M',
                    groupValue: _gender,
                    onChanged: (String? value) {
                      setState(() => _gender = value);
                    },
                  ),
                ),
                Expanded(
                  child: RadioListTile<String>(
                    title: Text('Female', style: GoogleFonts.breeSerif()),
                    value: 'F',
                    groupValue: _gender,
                    onChanged: (String? value) {
                      setState(() => _gender = value);
                    },
                  ),
                )
              ],
            ),


            // Country SECTION
            Text(
              'City',
              style: GoogleFonts.breeSerif(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            DropdownButton<int>(
              isExpanded: true,
              hint: const Text('Select City'),
              style: GoogleFonts.breeSerif(
                color: Colors.black,
              ),
              onChanged: (int? value) {
                setState(() => _selectedCountryId = value);
                print(value);
              },
              borderRadius: BorderRadius.circular(10),
              onTap: () {
                print('Tapped');
              },
              dropdownColor: Colors.grey.shade300,
              icon: const Icon(Icons.keyboard_arrow_down_sharp),
              itemHeight: 48,
              value: _selectedCountryId,
              underline: const Divider(color: Colors.grey, height: 0),

              items: _countries.map(
                    (country) {
                  return DropdownMenuItem<int>(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(country.title),
                        // Divider(
                        //   thickness: 0.8,
                        //   color: Colors.grey.shade400,
                        // )
                      ],
                    ),
                    value: country.id,
                  );
                },
              ).toList(),
            ),
       SizedBox(height: 10,),
            ElevatedButton(

                onPressed: ()=> perfomRegister(),
                style: ElevatedButton.styleFrom(
                  primary: StyleConstants.secondColor,
                    minimumSize: Size(double.infinity, 50.h),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.r))),
                child: Text(
                  'Create Account',
                  style: GoogleFonts.breeSerif(letterSpacing: 3),
                )),

            const SizedBox(height: 10),
            Center(
              child: RichText(
                text: TextSpan(
                  text: 'Already have an account?',
                  style: GoogleFonts.nunito(
                    color: Colors.grey.shade700,
                  ),
                  children: [
                    const TextSpan(text: ' '),
                    TextSpan(
                      text: 'Login Now!',
                      recognizer:_tapGestureRecognizer ,
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                        decorationStyle: TextDecorationStyle.solid,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


 //performLogin - checkData => login (Single Responsibility) SOLID
 void perfomRegister() {
   if (checkData()) {
     register();
   }
 }

 bool checkData() {
   if (_emailTextController.text.isNotEmpty &&
       _passwordTextController.text.isNotEmpty && _phoneTextController.text.isNotEmpty && _nameTextController.text.isNotEmpty && _selectedCountryId != null ) {
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
     _emailTextController.text.isEmpty ? 'Enter email' : null;
     _passwordErrorValue =
     _passwordTextController.text.isEmpty ? 'Enter password' : null;

     _cityErrorValue = _selectedCountryId == null ? 'select city' : null;
     _nameErrorValue = _nameTextController.text.isEmpty ? 'Enter your name' : null ;
     _phoneErrorValue =_phoneTextController.text.isEmpty? 'Enter mobile' : null ;  });
 }

 void register() {
   Navigator.pushReplacementNamed(context, '/verification_screen');
 }



}



