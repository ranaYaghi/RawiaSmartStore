import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_store/utilities/style_constants.dart';

import '../../widgets/on_boarding_content.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late PageController _pageController;
  int _currentPage = 0;

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
      body: Stack(
        children: [
          if (_currentPage == 0)
            Container(
              decoration: BoxDecoration(
                color: Colors.grey,
                image: DecorationImage(
                  colorFilter: new ColorFilter.mode(
                      Colors.black.withOpacity(0.65), BlendMode.dstATop),
                  image: AssetImage('images/1.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),

          if(_currentPage ==1)
            Container(
              decoration: BoxDecoration(
                color: Colors.grey,
                image: DecorationImage(
                  colorFilter: new ColorFilter.mode(
                      Colors.black.withOpacity(0.65), BlendMode.dstATop),
                  image: AssetImage('images/onboarding2.jpeg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          if(_currentPage ==2)
            Container(

              decoration: BoxDecoration(
                color: Colors.grey,
                image: DecorationImage(
                  colorFilter: new ColorFilter.mode(
                      Colors.black.withOpacity(.9), BlendMode.dstATop),
                  image: AssetImage('images/2.jpg'),
                  fit: BoxFit.cover,
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
            children: [
              OnBoardingContent(

                  title: 'Unique Dresses All Over The World',
                  subTitle: 'FEEL THE COMFORT'),
              OnBoardingContent(

                  title: 'A Woman Makes An Outfit her Own with Accessories',
                  subTitle: 'every piece is a story'),
              OnBoardingContent(

                  title: 'Good Shoes Take You To Good Places!',
                  subTitle: ''),
            ],
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 50),
              child: OutlinedButton(
                onPressed: () {
                  _currentPage ==2 ?
                      Navigator.pushReplacementNamed(context, '/register_screen')
                      :
                  _pageController.nextPage(duration: Duration(microseconds: 1), curve: Curves.easeIn);
                },
                child: Text(
                   _currentPage ==2 ? 'Register Now': 'Next',
                  style: GoogleFonts.breeSerif(
                      color: StyleConstants.secondColor,
                      fontSize: 15.sp,
                      letterSpacing: 2,
                      fontWeight: FontWeight.bold),
                ),
                style: OutlinedButton.styleFrom(
                    minimumSize: Size(240.w, 60.h),
                    side:
                        BorderSide(color: StyleConstants.secondColor, width: 5),
                    backgroundColor: Colors.transparent),
              ),
            ),
          ),

          //************************
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     PageViewIndicator(
          //       isCurrentPage: _currentPage == 0,
          //       marginEnd: 15,
          //     ),
          //     PageViewIndicator(
          //       isCurrentPage: _currentPage == 1,
          //       marginEnd: 15,
          //     ),
          //     PageViewIndicator(
          //       isCurrentPage: _currentPage == 2,
          //     ),
          //   ],
          // ),

          // const SizedBox(height: 25),
          // Visibility(
          //   visible: _currentPage == 2,
          //   maintainState: true,
          //   maintainSize: true,
          //   maintainAnimation: true,
          //   child: Padding(
          //     padding: const EdgeInsets.symmetric(horizontal: 30),
          //     child: DecoratedBox(
          //       decoration: BoxDecoration(
          //         borderRadius: BorderRadius.circular(10),
          //         boxShadow: const [
          //           BoxShadow(
          //               color: Colors.black38,
          //               offset: Offset(0, 3),
          //               blurRadius: 6)
          //         ],
          //         gradient: const LinearGradient(
          //           colors: [
          //             Color(0xFFA6D1E6),
          //             Color(0xFFFEFBF6),
          //           ],
          //         ),
          //       ),
          //       child: ElevatedButton(
          //         onPressed: () {
          //           Navigator.pushReplacementNamed(context, '/login_screen');
          //         },
          //         style: ElevatedButton.styleFrom(
          //           primary: Colors.transparent,
          //           shadowColor: Colors.transparent,
          //           minimumSize: const Size(double.infinity, 50),
          //           // shape: RoundedRectangleBorder(
          //           //   borderRadius: BorderRadius.circular(10),
          //           // ),
          //         ),
          //         child: const Text('START'),
          //       ),
          //     ),
          //   ),
          // ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TabPageSelectorIndicator(
                    backgroundColor: _currentPage == 0
                        ? StyleConstants.mainColor
                        : Colors.grey,
                    borderColor: _currentPage == 0
                        ? StyleConstants.secondColor
                        : Colors.transparent,
                    size: _currentPage == 0 ? 15 : 10),
                TabPageSelectorIndicator(
                    backgroundColor: _currentPage == 1
                        ? StyleConstants.mainColor
                        : Colors.grey,
                    borderColor: _currentPage == 1
                        ? StyleConstants.secondColor
                        : Colors.transparent,
                    size: _currentPage == 1 ? 15 : 10),
                TabPageSelectorIndicator(
                    backgroundColor: _currentPage == 2
                        ? StyleConstants.mainColor
                        : Colors.grey,
                    borderColor: _currentPage == 2
                        ? StyleConstants.secondColor
                        : Colors.transparent,
                    size: _currentPage == 2 ? 15 : 10),
              ],
            ),
          ),
          // const SizedBox(height: 25),
        ],
      ),
    );
  }
}
