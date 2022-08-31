
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_store/utilities/style_constants.dart';

import '../../widgets/page_view_indicator.dart';
import '../../widgets/product_gridview.dart';
import '../../widgets/product_slider_content.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({Key? key , required this.productId}) : super(key: key);
  final int productId ;
  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  late PageController _pageController;
  int _currentPage = 0;
   double _rate =5; // take it from api
  double _imageHieght = 450;
  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child:
        ListView(
          children: [
            ConstrainedBox
              (
              constraints: BoxConstraints(
                  maxHeight: _imageHieght
              ),
              child: Stack(
                children: [

                  if (_currentPage == 0)
                    Container(
                      height: _imageHieght,
                      width: double.infinity,
                      decoration: BoxDecoration(

                        image: DecorationImage(

                          image: AssetImage('images/prod5.webp'),
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),

                  if (_currentPage == 1)
                    Container(
                      height: _imageHieght,
                      width: double.infinity,
                      decoration: BoxDecoration(

                        image: DecorationImage(

                          image: AssetImage('images/1.jpg'),
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                  if (_currentPage == 2)
                    Container(
                      height: _imageHieght,
                      width: double.infinity,
                      decoration: BoxDecoration(

                        image: DecorationImage(

                          image: AssetImage('images/prod7.webp'),
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),




                  PageView(
                    physics: const BouncingScrollPhysics(),
                    // physics: ClampingScrollPhysics(),
                    controller: _pageController,
                    scrollDirection: Axis.horizontal,
                    onPageChanged: (int currentPage) {

                      setState(() => _currentPage = currentPage);
                    },
                    children: const [
                      SizedBox(),
                      SizedBox(),
                      SizedBox()
                    ],
                  ),

                  PositionedDirectional(
                    top: _imageHieght-20,
                    start: (MediaQuery.of(context).size.width /2) -20 ,
                    child: PageViewIndicator(
                      isCurrentPage: _currentPage == 0,
                      marginEnd: 15,
                    ),
                  ),
                  PositionedDirectional(
                    top: _imageHieght-20,
                    start: MediaQuery.of(context).size.width /2,
                    child: PageViewIndicator(
                      isCurrentPage: _currentPage == 1,
                      marginEnd: 15,
                    ),
                  ),
                  PositionedDirectional(
                    top: _imageHieght-20,
                    start: (MediaQuery.of(context).size.width /2) +20 ,
                    child: PageViewIndicator(
                      isCurrentPage: _currentPage == 2,
                    ),
                  ),
                  PositionedDirectional(
                    top:170,

                    child: IconButton(
                      color: StyleConstants.thirdColor,
                      onPressed: () {
                        if (_currentPage > 0) {
                          _pageController.previousPage(
                            duration: const Duration(seconds: 1),
                            curve: Curves.easeInOutBack,
                          );
                        }
                      },
                      icon: const Icon(Icons.arrow_back_ios),
                    ),),

                  PositionedDirectional(
                    end: 5,
                    top: 170,
                    child: IconButton(
                      color: StyleConstants.thirdColor,
                      onPressed: () {
                        if (_currentPage < 2) {
                          _pageController.nextPage(
                            duration: const Duration(seconds: 1),
                            curve: Curves.easeInOutBack,
                          );
                        }
                      },
                      icon: const Icon(Icons.arrow_forward_ios),
                    ),
                  ),




                ],
              ),
            ),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 10.w),
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  SizedBox(height: 10,),
                  Row(

                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Product Name' , style: GoogleFonts.breeSerif(
                        fontWeight: FontWeight.bold,

                      ),) ,

                      CircleAvatar(
                          radius: 20,
                          backgroundColor: StyleConstants.mainColor,

                          child: IconButton(onPressed: (){}, icon:Icon( Icons.favorite_outline) , color: Colors.red,)


                      ),

                    ],
                  ),
                  Text('50\$' ,style: GoogleFonts.breeSerif(
                    fontWeight: FontWeight.bold,color: Colors.red.shade900 )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text('Available quantity: ' ,style: GoogleFonts.breeSerif(
                              )),
                          Text('5', style: GoogleFonts.breeSerif(
                          )),
                        ],
                      ),
                      RatingBar.builder(
                        itemSize: 25,

                        initialRating: 3.5,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemPadding: EdgeInsets.zero,
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {
                          setState((){
                            _rate =rating;
                          });

                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Text('Rate: $_rate/5' , style: GoogleFonts.breeSerif(
                  )),

                  SizedBox(height: 15,),
                  Text('Lorem Ipsum is simply dummy text of the printing and Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been '),

                  SizedBox(height: 20,),

                  DecoratedBox(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.black38,
                            offset: Offset(0, 3),
                            blurRadius: 6)
                      ],
                      gradient:  LinearGradient(
                        colors: [
                          StyleConstants.thirdColor,
                          StyleConstants.mainColor,
                        ],
                      ),
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        //ToDo
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.transparent,
                        shadowColor: Colors.transparent,
                        minimumSize: const Size(double.infinity, 50),

                      ),
                      child: const Text('Add To Cart'),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Text('Related Product' , style: GoogleFonts.breeSerif(
                    fontWeight: FontWeight.bold,)),
                  SizedBox(height: 10,),

                  ProductGridView(),
                ],
              ),


            ),



          ],
        ),
      ),
    );
  }
}
