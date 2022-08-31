
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:smart_store/providers/app_provider.dart';
import 'package:smart_store/providers/product_provider.dart';
import 'package:smart_store/screens/app/categories_screen.dart';
import 'package:smart_store/screens/app/favourite_screen.dart';
import 'package:smart_store/screens/app/products_screen.dart';
import 'package:smart_store/screens/app/settings_screen.dart';
import 'package:smart_store/utilities/style_constants.dart';

import '../../models/bn_screen.dart';
import '../../providers/ads_provider.dart';
import 'home_screen.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({Key? key}) : super(key: key);

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  int _selectedPageIndex = 0;

  final List<BnScreen> _screens = <BnScreen>[
    const BnScreen(title: 'Home', widget: HomeScreen()),
    const BnScreen(title: 'Categories', widget: CategoryScreen()),
    const BnScreen(title: 'Product', widget: ProductScreen()),
    const BnScreen(title: 'Favourites', widget: FavaouriteScreen()),
    const BnScreen(title: 'Settings', widget: SettingsScreen()),

  ];

  @override
  Widget build(BuildContext context) {
    _selectedPageIndex =  Provider.of<AppProvider>(context).selectedPageIndex;
    return   Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(onPressed: (){

              Navigator.pushNamed(context, '/cart_screen');
            }, icon: Icon(Icons.add_shopping_cart_outlined))
          ],
          iconTheme: IconThemeData(
              color: StyleConstants.thirdColor
          ),
          backgroundColor: StyleConstants.secondColor,
          title: Text(_screens[_selectedPageIndex].title , style: GoogleFonts.breeSerif(color: StyleConstants.thirdColor),),
        ),

        body: _screens[_selectedPageIndex].widget,
        bottomNavigationBar: ClipRRect(
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(10),
            topLeft: Radius.circular(10),
          ),
          child: BottomNavigationBar(
            onTap: (int selectedPageIndex) {
              // setState(() => _selectedPageIndex = selectedPageIndex);
              Provider.of<AppProvider>(context , listen: false).changeSelectedPageIndex(selectedPageIndex);
            },
            currentIndex: _selectedPageIndex,
            backgroundColor: StyleConstants.secondColor,
            type: BottomNavigationBarType.fixed,
            // type: BottomNavigationBarType.shifting,
            //*********************************
            showSelectedLabels: true,
            showUnselectedLabels: true,
            //*********************************
            // fixedColor: Colors.black,
            selectedItemColor:StyleConstants.thirdColor,
            // selectedIconTheme: const IconThemeData(
            //   color: StyleConstants.thirdColor,
            //   // size: 14,
            // ),
            selectedLabelStyle: GoogleFonts.montserrat(
                fontWeight: FontWeight.bold,
                fontSize: 10,
                color: StyleConstants.thirdColor
            ),
            selectedFontSize: 14,
            //*********************************
            unselectedItemColor: StyleConstants.mainColor,
            unselectedIconTheme: IconThemeData(
              color: Colors.grey.shade800,
              // size: 18,
            ),
            unselectedLabelStyle: GoogleFonts.montserrat(
              fontSize: 11,
            ),
            unselectedFontSize: 12,
            //*********************************
            iconSize: 24,
            //*********************************
            elevation: 20,
            //*********************************
            items: [
              BottomNavigationBarItem(

                activeIcon: const Icon(Icons.home),
                icon: const Icon(Icons.home_outlined),
                label: 'Home',
              ),
              BottomNavigationBarItem(

                activeIcon: const Icon(Icons.list),
                icon: const Icon(Icons.list_alt_outlined),
                label: 'Categories',
              ),
              BottomNavigationBarItem(

                activeIcon: const Icon(Icons.password_rounded),
                icon: const Icon(Icons.password_outlined),
                label: 'Products',
              ),
              BottomNavigationBarItem(


                activeIcon: const Icon(Icons.favorite),
                icon: const Icon(Icons.favorite_outline),
                label: 'Favourities',
              ),
              BottomNavigationBarItem(


                activeIcon: const Icon(Icons.settings),
                icon: const Icon(Icons.settings),
                label: 'Settings',
              ),


            ],
          ),
        ),
      );


  }
}
