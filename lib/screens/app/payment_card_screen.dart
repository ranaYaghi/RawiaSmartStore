

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_store/utilities/style_constants.dart';
import 'package:smart_store/widgets/app_text_field.dart';



class Payment_card_screen extends StatefulWidget {
  const Payment_card_screen({Key? key ,  this.card}) : super(key: key);
  final Card? card;
  @override
  State<Payment_card_screen> createState() => _Payment_card_screenState();
}

class _Payment_card_screenState extends State<Payment_card_screen> {




  late TextEditingController _nameTextController;

  late TextEditingController _holderNameTextController;
  late TextEditingController _cardNumberTextController;
  late TextEditingController _expirationDateTextController;
  late TextEditingController _ccvTextController;


  String? _type ="Visa";

  //errors value

  String? _nameErrorValue;
  String? _holderNameErrorValue;
  String? _cardNumberErrorValue;
  String? _expirationErrorValue;
  String? _ccvErrorValue;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _nameTextController = TextEditingController();

    _holderNameTextController = TextEditingController();
    _cardNumberTextController = TextEditingController();
    _expirationDateTextController = TextEditingController();
    _ccvTextController = TextEditingController();



  }
  @override
  void dispose() {
    // TODO: implement dispose
    _nameTextController.dispose();
    _holderNameTextController.dispose();
    _cardNumberTextController.dispose();
    _expirationDateTextController.dispose();
    _ccvTextController.dispose();


    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
    iconTheme: IconThemeData(
    color: StyleConstants.thirdColor
    ),
    titleSpacing: 0,
    centerTitle: true,
    title: widget.card != null ?  Text('Update Card' , style: GoogleFonts.breeSerif(color:StyleConstants.thirdColor ),) :

      Text('Add New Card' , style: GoogleFonts.breeSerif(color:StyleConstants.thirdColor ),),

    ),
      backgroundColor: StyleConstants.mainColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: ListView(

          children: [
            SizedBox(height: 10,),
            Text(
              'Type',
              style: GoogleFonts.breeSerif(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: RadioListTile<String>(
                    activeColor: StyleConstants.thirdColor,
                    title: Text('Visa', style: GoogleFonts.breeSerif()),
                    value: 'Visa',
                    groupValue: _type,
                    onChanged: (String? value) {
                      setState(() => _type = value);
                    },
                  ),
                ),
                Expanded(
                  child: RadioListTile<String>(
                    activeColor: StyleConstants.thirdColor,
                    title: Text('Master', style: GoogleFonts.breeSerif()),
                    value: 'Master',
                    groupValue: _type,
                    onChanged: (String? value) {
                      setState(() => _type = value);
                    },
                  ),
                )
              ],
            ),

            SizedBox(height: 10,),
            AppTextField(hint: 'Name', errorString: _nameErrorValue ,prefixIcon: Icons.credit_card , controller: _nameTextController),
            SizedBox(height: 10,),
            AppTextField(hint: 'Holder Name', errorString: _holderNameErrorValue, keyboardType: TextInputType.text, prefixIcon: Icons.person , controller: _holderNameTextController),
            SizedBox(height: 10,),
            AppTextField(hint: 'Card Number', errorString: _cardNumberErrorValue, keyboardType: TextInputType.number, prefixIcon: Icons.numbers , controller: _cardNumberTextController),
            SizedBox(height: 10,),

            // GENDER SECTION


            Row(
              children: [
                Expanded(child: AppTextField(hint: 'Expiration date', keyboardType: TextInputType.datetime, errorString: _expirationErrorValue , prefixIcon: Icons.data_exploration , controller: _expirationDateTextController)),


                SizedBox(width: 10,),
                Expanded(child: AppTextField(hint: ' CCV', errorString: _ccvErrorValue , obscureText: true , prefixIcon: Icons.lock , controller: _ccvTextController)),

              ],
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
                  visible: widget.card == null,
                  replacement:   Text(
                      'Update Card',
                      style: GoogleFonts.breeSerif(letterSpacing: 3)),
                  child: Text(
                    'Add Card',
                    style: GoogleFonts.breeSerif(letterSpacing: 3),
                  ),
                )),



          const SizedBox(height: 10),

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

    _ccvTextController.text.isNotEmpty &&
        _nameTextController.text.isNotEmpty &&
    _holderNameTextController.text.isNotEmpty &&
    _expirationDateTextController.text.isNotEmpty && _cardNumberTextController.text.isNotEmpty
        && _type != null ) {
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
      _nameTextController.text.isEmpty ? 'Enter name' : null;
      _ccvErrorValue =
      _ccvTextController.text.isEmpty ? 'Enter ccv' : null;

      _holderNameErrorValue =
      _holderNameTextController.text.isEmpty ? 'Enter your name' : null;
      _expirationErrorValue = _expirationDateTextController.text.isEmpty
          ? 'Enter expiration date '
          : null;
      _cardNumberErrorValue =
      _cardNumberTextController.text.isEmpty ? 'Enter card number' : null;
    });
  }

  void addCard() {
    Navigator.pop(context);
  }

}



