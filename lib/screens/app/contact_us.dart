
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_store/utilities/style_constants.dart';
import 'package:smart_store/widgets/app_text_field.dart';

import '../../widgets/app_text_field_maxlines.dart';



class ContactUs extends StatefulWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {


  late TextEditingController _subjectTextController;
  late TextEditingController _descriptionTextController;



  //errors value


  String? _subjectErrorValue;

  String? _descriptionErrorValue;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _subjectTextController = TextEditingController();

    _descriptionTextController = TextEditingController();



  }
  @override
  void dispose() {
    // TODO: implement dispose
    _descriptionTextController.dispose();

    _subjectTextController.dispose();

    super.dispose();
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


            Text('Subject:' , style:  GoogleFonts.breeSerif(letterSpacing: 3),),
            SizedBox(height: 10,),
            AppTextField( errorString: _subjectErrorValue, keyboardType: TextInputType.text, prefixIcon: Icons.title , controller: _subjectTextController),
            SizedBox(height: 10,),

             Text('Description:' , style:  GoogleFonts.breeSerif(letterSpacing: 3),),
            SizedBox(height: 10,),

            AppTextMaxField(maxLines: 8,  errorString: _descriptionErrorValue , controller: _descriptionTextController),



            SizedBox(height: 10,),



            ElevatedButton(

                onPressed: ()=> perfomSend(),
                style: ElevatedButton.styleFrom(
                    primary: StyleConstants.secondColor,
                    minimumSize: Size(double.infinity, 50.h),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.r))),
                child: Text(
                  'Send',
                  style: GoogleFonts.breeSerif(letterSpacing: 3),
                )),

            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }


  //performLogin - checkData => login (Single Responsibility) SOLID
  void perfomSend() {
    if (checkData()) {
      send();
    }
  }

  bool checkData() {
    if (
    _subjectTextController.text.isNotEmpty && _descriptionTextController.text.isNotEmpty ) {
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

      _subjectErrorValue =
      _subjectTextController.text.isEmpty ? 'Enter Subject' : null;


      _descriptionErrorValue =_descriptionTextController.text.isEmpty? 'Enter Description' : null ;  });
  }

  void send() {
    Navigator.of(context).pushNamedAndRemoveUntil(
        '/bottom_navigation_screen', (Route<dynamic> route) => false);

  }

}



