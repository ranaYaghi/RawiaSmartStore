import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:smart_store/screens/app/subcategories_screen.dart';
import 'package:smart_store/utilities/style_constants.dart';

import '../../providers/ads_provider.dart';
import '../../providers/app_provider.dart';
import '../../providers/category_provider.dart';
import '../../widgets/home_section.dart';
import '../../widgets/product_gridview.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late PageController _pageController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController(viewportFraction: 0.8, initialPage: 1);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Provider<AdsProvider>(
        create: (context) => AdsProvider(),
        builder: (BuildContext context, Widget? child) {
          return ListView(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            children: [
              ConstrainedBox(
                constraints: BoxConstraints(maxHeight: 200),
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: Provider.of<AdsProvider>(context).advs.length,
                  scrollDirection: Axis.horizontal,
                  onPageChanged: (int pageIndex) {
                    // if(pageIndex == 2) {
                    // _pageController.animateToPage(0, duration: Duration(seconds: 1), curve: Curves.easeIn);
                    // }
                  },
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(Provider.of<AdsProvider>(context)
                                .advs[index]
                                .image)),
                      ),
                      margin: EdgeInsetsDirectional.only(
                          end: index !=
                                  Provider.of<AdsProvider>(context).advs.length
                              ? 10
                              : 0),
                    );
                  },
                ),
              ),
              HomeSection(
                  title: 'Categories',
                  onPressed: () {
                    Provider.of<AppProvider>(context, listen: false).changeSelectedPageIndex(1);

                  }),

              ConstrainedBox(
                constraints: const BoxConstraints(maxHeight: 170),
                child: GridView.builder(
                  itemCount: 10,
                  scrollDirection: Axis.horizontal,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    mainAxisSpacing: 10,
                    // mainAxisExtent: 90,
                    childAspectRatio: 170 / 80,
                  ),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>  SubCategoryScreen(categoryId:  Provider.of<CategoryProvider>(context)
                              .categories[index].id
                          )),
                        );
                      },
                      child: Column(
                        children: [
                          CircleAvatar(


                            backgroundImage: AssetImage(
                                Provider.of<CategoryProvider>(context)
                                    .categories[index]
                                    .image ) ,
                            radius: 50,
                          ),

                          Text(Provider.of<CategoryProvider>(context)
                              .categories[index]
                              .name , style: GoogleFonts.breeSerif(color: StyleConstants.thirdColor),)
                        ],
                      ),
                    ) ;

                  },
                ),
              ),

              HomeSection(
                  title: 'Latest Products',
                  onPressed: () {
                    Provider.of<AppProvider>(context, listen: false).changeSelectedPageIndex(2);
                  }),
              ConstrainedBox(
                constraints: const BoxConstraints(maxHeight: 230),
                child: GridView.builder(
                  itemCount: Provider.of<CategoryProvider>(context)
                      .categories.length,
                  scrollDirection: Axis.horizontal,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    mainAxisSpacing: 10,
                    // mainAxisExtent: 90,
                    childAspectRatio: 130 / 90,
                  ),
                  itemBuilder: (context, index) {
                    return Stack(
                      children: [


                        Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      Provider.of<CategoryProvider>(context)
                                          .categories[index]
                                          .image))),
                        ),
                        PositionedDirectional(
                          start : 5.w,
                          top: 15.h,
                          child: CircleAvatar(
                              radius: 20,
                              backgroundColor: StyleConstants.mainColor,

                              child: IconButton(onPressed: (){}, icon:Icon( Icons.favorite_outline) , color: Colors.red,)


                          ),
                        ),
                        PositionedDirectional(
                            start: 5,
                            bottom :15 ,
                            child: Text(Provider.of<CategoryProvider>(context)
                                .categories[index]
                                .name , style: GoogleFonts.breeSerif(color: StyleConstants.thirdColor),)),

                      ],
                    );
                  },
                ),
              ),
              SizedBox(height: 1.h),
              HomeSection(
                  title: 'Products you may like',
                  onPressed: () {
                    Provider.of<AppProvider>(context, listen: false).changeSelectedPageIndex(2);
                  }),
              ProductGridView(),
            ],
          );
        });
  }
}
