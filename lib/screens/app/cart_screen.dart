import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:smart_store/utilities/style_constants.dart';

import '../../providers/cart_provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: StyleConstants.thirdColor, size: 30),
        centerTitle: true,
        title: Text('Cart',
            style: GoogleFonts.breeSerif(
                fontSize: 18, color: StyleConstants.thirdColor)),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.delete_outline),
          ),
        ],
      ),
      body: Consumer<CartProvider>(
        builder: (context, CartProvider value, child) {
          print(value.cartItems.length);
          if (value.cartItems.isNotEmpty) {
            return Container(
              margin: EdgeInsets.all(15),
              child: Column(
                
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: value.cartItems.length,
                      itemBuilder: (context, index) {
                        return Dismissible(

                          key: UniqueKey(),

                          child: Card(
                            elevation: 4,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Row(
                                  children: [
                                    Container(
                                      clipBehavior: Clip.antiAlias,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          boxShadow: [
                                            BoxShadow(
                                              offset: Offset(2, 5),
                                              blurRadius: 4,
                                              color: Colors.black.withOpacity(0.3),
                                            ),
                                          ]),
                                      child: Image(
                                        image: AssetImage(
                                          value.cartItems[index].image,
                                        ),
                                        fit: BoxFit.fill,
                                      ),
                                      width: 100,
                                      height: 110,
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 15.h),
                                      child: Column(
                                        children: [
                                          Text(value.cartItems[index].productName),
                                          Text(value.cartItems[index].price.toString())
                                        ],
                                      ),
                                    ),
                                    Spacer(),
                                     Column(
                                       children: [
                                         OutlinedButton(
                                             style: OutlinedButton.styleFrom(

                                               padding: EdgeInsets.zero,
                                               backgroundColor: StyleConstants.thirdColor,

                                             ),
                                             onPressed: (){}, child: Icon(Icons.plus_one , color: StyleConstants.mainColor,)),

                                         Text('Q:1'),

                                    OutlinedButton(
                                            style: OutlinedButton.styleFrom(

                                                padding: EdgeInsets.zero,
                                                backgroundColor: StyleConstants.thirdColor,

                                            ),
                                            onPressed: (){}, child: Icon( Icons.exposure_minus_1, color: StyleConstants.mainColor,)),
                                       ],
                                     ),

                                  ],
                                )),
                          ),
                          background: Container(

                            margin: EdgeInsets.all(30),
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
                                      style:
                                      TextStyle(color: StyleConstants.mainColor)),
                                ],
                              ),
                            ),
                          ),
                        );

                      },
                    ),
                  ),


                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Total:',
                        style: GoogleFonts.breeSerif(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      Text(
                        value.total.toString(),
                        style: GoogleFonts.breeSerif(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Quantity:',
                        style: GoogleFonts.breeSerif(
                          fontSize: 15.sp,

                        ),
                      ),

                      Text(
                        value.quantity.toString(),
                        style: GoogleFonts.breeSerif(
                          fontSize: 15.sp,

                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 20,),
                  ElevatedButton(
 
                      onPressed: (){
                        Navigator.pushNamed(context, '/cart_submit');
                      },
                      style: ElevatedButton.styleFrom(
                        
                          
                          primary: StyleConstants.thirdColor,
                          minimumSize: Size(double.infinity, 50.h),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.r))),
                      child: Text(
                        'Continue',
                        style: GoogleFonts.breeSerif(letterSpacing: 3),
                      )),
                  SizedBox(height: 20,),
                ],
              ),
            );
          } else {
            return Align(
              alignment: Alignment.center,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 100,
                      backgroundColor: StyleConstants.mainColor,
                      // backgroundImage: AssetImage('images/cart1.png' , ),
                      child: Image(
                        image: AssetImage(
                          'images/cart1.png',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Cart Is Empty',
                      style: GoogleFonts.breeSerif(
                          fontSize: 18, color: StyleConstants.thirdColor),
                    ),
                  ]),
            );
          }
        },
      ),
    );
  }
}
