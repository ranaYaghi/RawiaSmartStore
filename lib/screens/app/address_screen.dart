import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:smart_store/Models/address.dart';

import '../../models/country.dart';
import '../../utilities/style_constants.dart';
import '../../widgets/app_text_field.dart';


class AddressScreen extends StatefulWidget {


  const  AddressScreen({Key? key,  this.address}) : super(key: key);
   final Address? address;

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {

 late TextEditingController nameTextController ;
 late TextEditingController contactTextController;
 late TextEditingController locationTextController;
 late TextEditingController infoTextController ;

 //errors value

 String? _nameErrorValue;
 String? _contactTextErrorValue;
 String? _infoErrorValue;


 int? _selectedCountryId;
 final List<Country> _countries = <Country>[
   const Country(id: 1, title: 'Palestine'),
   const Country(id: 2, title: 'Egypt'),
   const Country(id: 3, title: 'Moroco'),
   const Country(id: 4, title: 'Jordan'),
 ];
  @override
  void initState() {
    super.initState();
    nameTextController  = TextEditingController();
    contactTextController = TextEditingController();
    infoTextController = TextEditingController();
    locationTextController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose

    nameTextController.dispose();
    contactTextController.dispose();
    infoTextController.dispose();
    locationTextController.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:StyleConstants.secondColor,
      appBar: AppBar(
        backgroundColor:StyleConstants.secondColor,
        iconTheme: IconThemeData(
            color: StyleConstants.thirdColor
        ),
        titleSpacing: 0,
        centerTitle: true,
        title: widget.address != null ?  Text('Update Card' , style: GoogleFonts.breeSerif(color:StyleConstants.thirdColor ),) :

        Text('Add New Address' , style: GoogleFonts.breeSerif(color:StyleConstants.thirdColor ),),

      ),
      body: Container(

        clipBehavior: Clip.antiAlias,
        decoration:  BoxDecoration(
            color: StyleConstants.mainColor,
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: ListView(

          children: [


          Image(image: AssetImage('images/mappointer1.jpg') , fit: BoxFit.cover,),
            Container(

              margin: EdgeInsets.all(15),
              child: Column(
                
                children: [
                  SizedBox(height: 10,),
                  AppTextField(hint: 'name', errorString: _nameErrorValue ,prefixIcon: Icons.credit_card , controller: nameTextController),
                  SizedBox(height: 10,),
                  AppTextField(hint: 'contact number', errorString: _contactTextErrorValue, keyboardType: TextInputType.phone, prefixIcon: Icons.phone , controller: contactTextController),
                  SizedBox(height: 10,),
                  AppTextField(hint: 'info', errorString: _infoErrorValue, keyboardType: TextInputType.text, prefixIcon: Icons.info , controller: infoTextController),
                  SizedBox(height: 10,),
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

                      onPressed: ()=> perfomAddCard(),
                      style: ElevatedButton.styleFrom(
                          primary: StyleConstants.secondColor,
                          minimumSize: Size(double.infinity, 50.h),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.r))),
                      child: Visibility(
                        visible: widget.address == null,
                        replacement:   Text(
                            'Update Address',
                            style: GoogleFonts.breeSerif(letterSpacing: 3)),
                        child: Text(
                          'Add Address',
                          style: GoogleFonts.breeSerif(letterSpacing: 3),
                        ),
                      )),



                  const SizedBox(height: 10),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }

 //performLogin - checkData => login (Single Responsibility) SOLID
 void perfomAddCard() {
   if (checkData()) {
     addCard();
   }
 }

 bool checkData() {
   if (

   infoTextController.text.isNotEmpty &&
       nameTextController.text.isNotEmpty &&
       contactTextController.text.isNotEmpty &&
        _selectedCountryId != null ) {
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
     _nameErrorValue =
     nameTextController.text.isEmpty ? 'Enter name' : null;
     _contactTextErrorValue =
     contactTextController.text.isEmpty ? 'Enter contact number' : null;

     _infoErrorValue =
     infoTextController.text.isEmpty ? 'Enter info' : null;


   });
 }

 void addCard() {
   Navigator.pop(context);
 }
}
