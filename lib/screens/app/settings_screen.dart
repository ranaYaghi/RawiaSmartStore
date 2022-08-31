import 'dart:math';


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_store/utilities/style_constants.dart';
import 'package:smart_store/widgets/app_text_field.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../models/country.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _notifications = false;
  RangeValues _priceValues = const RangeValues(50, 100);
  String? _gender;
  int? _selectedCountryId;
  String? _phoneErrorValue;
  late TextEditingController _phoneTextController;

  late TextEditingController _experienceTextController;

  //CATEGORIES List


  //Countries List
  final List<Country> _countries = <Country>[
    const Country(id: 1, title: 'Palestine'),
    const Country(id: 2, title: 'Egypt'),
    const Country(id: 3, title: 'Moroco'),
    const Country(id: 4, title: 'Jordan'),
  ];

  List<String> _experiences = <String>[];
  late String _language ="ar";
  @override
  void initState() {
    super.initState();
    _experienceTextController = TextEditingController();
    _phoneTextController = TextEditingController();
  }

  @override
  void dispose() {
    _experienceTextController.dispose();
    _phoneTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(

      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      children: [


        //language
        GestureDetector(
          onTap: (){
            _showLanguageBottomSheet();

          },
          child: Card(

            elevation: 5,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
            ),
            child:  Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0 , vertical: 12),
                child: Row(
                  children: [
                    Icon(
                      Icons.language, color: StyleConstants.thirdColor,

                    ),
                    SizedBox(width: 10,),
                    Text('Language' ,  style: GoogleFonts.breeSerif(
                        fontSize: 16
                    ),),
                  ],
                )
            ),
          ),
        ),
        // Profile
        GestureDetector(
          onTap: (){

            Navigator.pushNamed(context, '/profile_screen');
          },
          child: Card(

            elevation: 5,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
            ),
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0 , vertical: 12),
                child: Row(
                  children: [
                    Icon(
                      Icons.person, color: StyleConstants.thirdColor,

                    ),
                    SizedBox(width: 10,),
                    Text('Profile' ,  style: GoogleFonts.breeSerif(
                        fontSize: 16
                    ),),
                  ],
                )
            ),
          ),
        ),
           //Edit Mobile

        GestureDetector(
          onTap: (){

            _showEditMobileBottomSheet();
          },
          child: Card(

            elevation: 5,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
            ),
            child:  Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0 , vertical: 12),
                child: Row(
                  children: [
                    Icon(
                      Icons.mobile_friendly, color: StyleConstants.thirdColor,

                    ),
                    SizedBox(width: 10,),
                    Text('Change Mobile Number' ,  style: GoogleFonts.breeSerif(
                        fontSize: 16
                    ),),
                  ],
                )
            ),
          ),
        ),

        //Notification
        GestureDetector(
          onLongPress: (){

            Navigator.pushNamed(context, '/notification_screen');
          },
          child: Card(

            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: SwitchListTile(

                contentPadding: EdgeInsets.zero,
                activeColor:StyleConstants.thirdColor,
                activeTrackColor: StyleConstants.thirdColor,
                //************
                inactiveTrackColor: Colors.grey[300],
                inactiveThumbColor: Colors.grey[300],
                title: Row(

                  children:[
                    Icon(Icons.notification_add , color: StyleConstants.thirdColor,),
                    SizedBox(width: 10, ),
                    Text(
                    'Notifications',
                    style: GoogleFonts.breeSerif(
                      fontSize: 16
                    ),),


    ]
                  ),


                value: _notifications,
                onChanged: (bool value) {
                  setState(() => _notifications = value);
                },

              ),
            ),
          ),
        ),




     // Payment section
        GestureDetector(
          onTap: (){

            Navigator.pushNamed(context, '/payment_card_list_screen');
          },
          child: Card(

            elevation: 5,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
            ),
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0 , vertical: 12),
                child: Row(
                  children: [
                    Icon(
                      Icons.payment, color: StyleConstants.thirdColor,

                    ),
                    SizedBox(width: 10,),
                    Text('Payment Cards' ,  style: GoogleFonts.breeSerif(
                        fontSize: 16
                    ),),
                  ],
                )
            ),
          ),
        ),

        // Addresses section
        GestureDetector(
          onTap: (){

            Navigator.pushNamed(context, '/addresses_screen');
          },
          child: Card(

            elevation: 5,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
            ),
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0 , vertical: 12),
                child: Row(
                  children: [
                    Icon(
                      Icons.map, color: StyleConstants.thirdColor,

                    ),
                    SizedBox(width: 10,),
                    Text('Addresses' ,  style: GoogleFonts.breeSerif(
                        fontSize: 16
                    ),),
                  ],
                )
            ),
          ),
        ),


        //Oreder section
        GestureDetector(
          onTap: (){

            Navigator.pushNamed(context, '/order_screen');
          },
          child: Card(

            elevation: 5,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
            ),
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0 , vertical: 12),
                child: Row(
                  children: [
                    Icon(
                      Icons.shopping_cart_rounded, color: StyleConstants.thirdColor,

                    ),
                    SizedBox(width: 10,),
                    Text('Orders' ,  style: GoogleFonts.breeSerif(
                        fontSize: 16
                    ),),
                  ],
                )
            ),
          ),
        ),

        //contact Us section
        GestureDetector(
          onTap: (){

            Navigator.pushNamed(context, '/contact_us_screen');
          },
          child: Card(

            elevation: 5,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
            ),
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0 , vertical: 12),
                child: Row(
                  children: [
                    Icon(
                      Icons.logout, color: StyleConstants.thirdColor,

                    ),
                    SizedBox(width: 10,),
                    Text('Contact us' ,  style: GoogleFonts.breeSerif(
                        fontSize: 16
                    ),),
                  ],
                )
            ),
          ),
        ),
        //About
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0 , vertical: 12),
            child: Column(
              children: [


                Image(image: AssetImage('images/logo.png') ),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children:


                 [
                   Icon( Icons.facebook),
                   SizedBox(width: 10,),
                   new InkWell(
                       child: new Text('NERODRESS',  style: GoogleFonts.breeSerif(

                       ),),
                       onTap: () => launch('https://docs.flutter.io/flutter/services/UrlLauncher-class.html')
                   ),
                 ],),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                  Text('Rawia Yaghi-Elancer' ,  style: GoogleFonts.breeSerif(

                  ),),
                ],)
              ],
            )
        ),


        //LogOut
        GestureDetector(
          onTap: (){

            Navigator.pushNamed(context, '/login_screen');
          },
          child: Card(

            elevation: 5,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
            ),
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0 , vertical: 12),
                child: Row(
                  children: [
                    Icon(
                      Icons.logout, color: StyleConstants.thirdColor,

                    ),
                    SizedBox(width: 10,),
                    Text('Logout' ,  style: GoogleFonts.breeSerif(
                        fontSize: 16
                    ),),
                  ],
                )
            ),
          ),
        ),


      ],
    );
  }

  void _delete(String experience) {
    setState(() => _experiences.remove(experience));
  }

  void _performSave() {
    if (_checkData()) {
      _save();
    }
  }

  bool _checkData() {
    if (_experiences.length < 6) {
      if (_experienceTextController.text.isNotEmpty) {
        return true;
      } else {
        showMessage('Enter required data!');
        return false;
      }
    }
    showMessage('You have reached the limit of count');
    return false;
  }

  void showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content:  Text(message),
        backgroundColor: Colors.red,
      ),
    );
  }

  void _save() {
    setState(() => _experiences.add(_experienceTextController.text));
    _experienceTextController.clear();
  }


  void _showLanguageBottomSheet() async {
    String? langCode = await showModalBottomSheet<String>(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      backgroundColor: Colors.white,
      clipBehavior: Clip.antiAlias,
      context: context,
      builder: (context) {
        return BottomSheet(
          onClosing: () {},
          builder: (context) {
            return StatefulBuilder(
              builder: (context, setState) {
                return Padding(
                  padding:
                  EdgeInsets.symmetric(horizontal: 25.w, vertical: 15.h),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                       'Language',
                        style: GoogleFonts.cairo(
                          fontSize: 18.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),


                      Divider(),
                      RadioListTile<String>(
                        title: Text('English', style: GoogleFonts.cairo()),
                        value: 'en',
                        groupValue: _language,
                        onChanged: (String? value) {
                          if (value != null) {
                            setState(() => _language = value);
                            Navigator.pop(context, 'en');
                          }
                        },
                      ),
                      RadioListTile<String>(
                        title: Text('العربية', style: GoogleFonts.cairo()),
                        value: 'ar',
                        groupValue: _language,
                        onChanged: (String? value) {
                          if (value != null) {
                            setState(() => _language = value);
                            Navigator.pop(context, 'ar');
                          }
                        },
                      ),
                    ],
                  ),
                );
              },
            );
          },
        );
      },
    );

    if (langCode != null) {
      Future.delayed(const Duration(milliseconds: 500), () {
      //  Provider.of<LanguageProvider>(context, listen: false).changeLanguage();
      });
    }
  }

  void _showEditMobileBottomSheet() async {
    showModalBottomSheet<String>(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      backgroundColor: Colors.white,
      clipBehavior: Clip.antiAlias,
      isScrollControlled:true,

      context: context,
      builder: (context) {
        return BottomSheet(

          onClosing: () {},
          builder: (context) {
            return StatefulBuilder(
              builder: (context, setState) {
                return Padding(
                  padding: MediaQuery.of(context).viewInsets,
                  child: Padding(
                    padding:    EdgeInsets.symmetric(horizontal: 25.w, vertical: 15.h),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'New Mobile Number',
                          style: GoogleFonts.cairo(
                            fontSize: 18.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),


                        Divider(),
                        AppTextField(hint: 'Mobile', errorString: _phoneErrorValue, keyboardType: TextInputType.phone, prefixIcon: Icons.phone , controller: _phoneTextController),
                        SizedBox(height: 10,),
                        ElevatedButton(

                            onPressed: ()=> perfomChangeMobile(),
                            style: ElevatedButton.styleFrom(
                                primary: StyleConstants.secondColor,
                                minimumSize: Size(double.infinity, 50.h),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.r))),
                            child: Text(
                              'Save New Mobile Number',
                              style: GoogleFonts.breeSerif(letterSpacing: 3),
                            )),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        );
      },
    );



  }

  //performLogin - checkData => login (Single Responsibility) SOLID
  void perfomChangeMobile() {
    if (checkData()) {
      change();
    }
  }

  bool checkData() {
    if (
         _phoneTextController.text.isNotEmpty ) {
      _controlErrorValue();
      return true;
    }
    _controlErrorValue();

    return false;
  }

  void _controlErrorValue() {
    setState(() {



      _phoneErrorValue =_phoneTextController.text.isEmpty? 'Enter mobile' : null ;  });
  }

  void change() {
    //Todo
    Navigator.pushReplacementNamed(context, '/verification_edit_mobile_screen');
  }
}
