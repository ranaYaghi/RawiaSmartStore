import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:smart_store/models/card.dart';
import 'package:smart_store/providers/card_provider.dart';
import 'package:smart_store/screens/app/payment_card_screen.dart';
import 'package:smart_store/utilities/style_constants.dart';

class PaymentCardListScreen extends StatefulWidget {
  const PaymentCardListScreen({Key? key}) : super(key: key);

  @override
  State<PaymentCardListScreen> createState() => _PaymentCardListScreenState();
}

class _PaymentCardListScreenState extends State<PaymentCardListScreen> {

  int? _oneValue ;
  @override
  Widget build(BuildContext context) {
    var cards  = Provider.of<CardProvider>(context)!.cards;
    return Scaffold(

      backgroundColor: StyleConstants.mainColor,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: StyleConstants.thirdColor
        ),
        titleSpacing: 0,
        centerTitle: true,
        title: Text('saved payment methods' , style: GoogleFonts.breeSerif(color:StyleConstants.thirdColor ),),

      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: StyleConstants.thirdColor,
        onPressed: () {
          Navigator.pushNamed(context, '/payment_card_screen');
        },
        child: Icon(Icons.add)),

      body: ListView.builder(


        padding: EdgeInsets.symmetric(horizontal: 10.w , vertical: 10.h ),
          itemCount: cards.length,
          itemBuilder: (context , index){


        return Dismissible(
          onDismissed: (direction) {
            if (direction == DismissDirection.startToEnd) {
              //Delete
            } else if (direction ==
                DismissDirection.endToStart) {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  Payment_card_screen(card: new Card()
              )));
            }
          },
          confirmDismiss: (DismissDirection direction) async {
            if (direction == DismissDirection.startToEnd) {
              return await showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text("Delete Confirmation"),
                    content: const Text(
                        "Are you sure you want to delete this card?"),
                    actions: <Widget>[
                      ElevatedButton(
                          onPressed: () =>
                              Navigator.of(context).pop(true),
                          child: const Text("Delete")),
                      ElevatedButton(
                        onPressed: () =>
                            Navigator.of(context).pop(false),
                        child: const Text("Cancel"),
                      ),
                    ],
                  );
                },
              );
            }
            else if(direction ==
                DismissDirection.endToStart){
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return  Payment_card_screen(card: new Card());
                },
              ));
            }
          },
          background: Container(
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),

            color: Colors.red.shade900,
            ),
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                children: <Widget>[
                  Icon(Icons.delete, color: StyleConstants.mainColor),
                  Text('Delete',
                      style: TextStyle(color:  StyleConstants.mainColor)),
                ],
              ),
            ),
          ),
          secondaryBackground: Container(
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            color: StyleConstants.thirdColor,
            ),
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text('Edit',
                      style: TextStyle(color: StyleConstants.mainColor)),
                  Icon(Icons.edit, color: StyleConstants.mainColor),
                ],
              ),
            ),
          ),

          key: UniqueKey(),
          child: Container(
        margin: EdgeInsets.symmetric(vertical: 5.h),
            padding: EdgeInsets.symmetric(vertical: 5.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),

               color: Colors.grey.shade400
            ),
            child: RadioListTile<int>(


                activeColor:  StyleConstants.thirdColor,
                value: cards[index].id,
                groupValue: _oneValue,
                onChanged: (value) {
                  setState(() {
                    _oneValue = value;
                  });
                },

        
               title: Card(
 shadowColor: StyleConstants.thirdColor  ,
                elevation: 5,
                child: Padding(
                  padding:  EdgeInsets.symmetric( horizontal: 8.w , vertical: 8.h),
                  child: ListTile(

                    title:Row(

                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [



                        Text('Name' , style: GoogleFonts.breeSerif()),
                        Text('5/2/2023' ,  style: GoogleFonts.breeSerif())

                      ],
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Row(


                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [


                            Text('Holder Name' , style: GoogleFonts.breeSerif(),),


                          ],
                        ),
                        Text('Type' ,  style: GoogleFonts.breeSerif())
                      ],
                    ),

                  ),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
