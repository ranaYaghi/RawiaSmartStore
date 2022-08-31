import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_store/screens/app/details_screen.dart';
import 'package:smart_store/utilities/style_constants.dart';

import 'order_details.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        appBar:  AppBar(
          iconTheme: IconThemeData(color: StyleConstants.thirdColor, size: 30),
          centerTitle: true,
          title: Text('Orders ',
              style: GoogleFonts.breeSerif(
                  fontSize: 18, color: StyleConstants.thirdColor)),
          actions: [],
        ),


        body: ListView.builder(
          itemCount: 3,
          itemBuilder: (context , builder){
            return GestureDetector(
              onTap: (){

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  OrderDetails()
                  ));

              },

              child: Card(
                margin: const EdgeInsets.symmetric(horizontal: 7, vertical: 5),
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('#1'),
                        Column(
                          children: [
                            Text(
                              'Order Name',
                              style: GoogleFonts.breeSerif(
                                  fontSize: 18, color: StyleConstants.thirdColor),
                            ),
                            Text('WAITING - ONLINE',
                                style: GoogleFonts.breeSerif(
                                    fontSize: 12,
                                    color: StyleConstants.secondColor)),
                            Row(
                              children: [
                                Text('20\$ ... ',
                                    style: GoogleFonts.breeSerif(
                                        fontSize: 14,
                                        color: StyleConstants.thirdColor)),
                                Text('2020-01-01  ',
                                    style: GoogleFonts.breeSerif(
                                        fontSize: 14,
                                        color: StyleConstants.secondColor)),
                              ],
                            )
                          ],
                        ),
                        const IconButton(
                            onPressed: null, icon: Icon(Icons.info_outline))
                      ]),
                ),
              ),
            );
          },

        ),

    );
  }
}
