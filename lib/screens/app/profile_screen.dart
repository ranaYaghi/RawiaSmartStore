import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_store/utilities/style_constants.dart';
import 'package:smart_store/widgets/app_text_field.dart';

import '../../models/country.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  late TextEditingController _nameTextController;
  late TextEditingController _emailTextController;

  late TapGestureRecognizer _tapGestureRecognizer;


  int? _selectedCountryId;
  final List<Country> _countries = <Country>[
    const Country(id: 1, title: 'Palestine'),
    const Country(id: 2, title: 'Egypt'),
    const Country(id: 3, title: 'Moroco'),
    const Country(id: 4, title: 'Jordan'),
  ];

  //errors value

  String? _emailErrorValue;

  String? _nameErrorValue;
  String? _cityErrorValue;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _nameTextController = TextEditingController();

    _emailTextController = TextEditingController();



  }
  @override
  void dispose() {
    // TODO: implement dispose
    _emailTextController.dispose();

    _emailTextController.dispose();


    super.dispose();
  }


  void loginToYourAccount() {
    Navigator.pushNamed(context, '/login_screen');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [IconButton(onPressed: (){

          Navigator.pushNamed(context, '/new_password_screen');
        }, icon:Icon(Icons.lock, size: 30,) )],
      ),
      backgroundColor: StyleConstants.mainColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: ListView(

          children: [Image(image: AssetImage('images/clothing_logo_1.png')) ,
            AppTextField(hint: 'Name', errorString: _nameErrorValue ,prefixIcon: Icons.person , controller: _nameTextController),
            SizedBox(height: 10,),

            AppTextField(hint: 'Email', errorString: _emailErrorValue, keyboardType: TextInputType.emailAddress, prefixIcon: Icons.email , controller: _emailTextController),
            SizedBox(height: 10,),

            // GENDER SECTION







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
                  'Update my information',
                  style: GoogleFonts.breeSerif(letterSpacing: 3),
                )),


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
 _nameTextController.text.isNotEmpty && _selectedCountryId != null ) {
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


      _cityErrorValue = _selectedCountryId == null ? 'select city' : null;
      _nameErrorValue = _nameTextController.text.isEmpty ? 'Enter your name' : null ;
     });
  }

  void register() {
    Navigator.pushReplacementNamed(context, '/verification_screen');
  }

}



