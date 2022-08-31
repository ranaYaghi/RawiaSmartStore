import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:smart_store/providers/addresses_provider.dart';
import 'package:smart_store/providers/app_provider.dart';
import 'package:smart_store/providers/card_provider.dart';
import 'package:smart_store/providers/cart_provider.dart';
import 'package:smart_store/providers/category_provider.dart';
import 'package:smart_store/providers/favourite_provider.dart';
import 'package:smart_store/providers/product_provider.dart';
import 'package:smart_store/screens/app/addresses_list_screen.dart';

import 'package:smart_store/screens/app/bottom_navigation_screen.dart';
import 'package:smart_store/screens/app/cart_screen.dart';
import 'package:smart_store/screens/app/cart_submit.dart';
import 'package:smart_store/screens/app/categories_screen.dart';
import 'package:smart_store/screens/app/contact_us.dart';
import 'package:smart_store/screens/app/details_screen.dart';

import 'package:smart_store/screens/app/home_screen.dart';
import 'package:smart_store/screens/app/notification_screen.dart';
import 'package:smart_store/screens/app/order_details.dart';
import 'package:smart_store/screens/app/order_screen.dart';
import 'package:smart_store/screens/app/payment_card_list_screen.dart';
import 'package:smart_store/screens/app/payment_card_screen.dart';
import 'package:smart_store/screens/app/products_screen.dart';
import 'package:smart_store/screens/app/profile_screen.dart';
import 'package:smart_store/screens/auth/forget_password.dart';
import 'package:smart_store/screens/auth/login_screen.dart';
import 'package:smart_store/screens/auth/new_password_screen.dart';
import 'package:smart_store/screens/auth/register_screen.dart';

import 'package:smart_store/screens/auth/reset_password_screen.dart';
import 'package:smart_store/screens/auth/verification_edit_mobile_screen.dart';
import 'package:smart_store/screens/auth/verification_screen.dart';
import 'package:smart_store/screens/launch_screen.dart';
import 'package:smart_store/screens/onboarding/onboarding_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<ProductProvider>(
            create: (context) => ProductProvider(),
          ),
          ChangeNotifierProvider<CategoryProvider>(
            create: (context) => CategoryProvider(),
          ),

          ChangeNotifierProvider<AppProvider>(
            create: (context) => AppProvider(),
          ),

          ChangeNotifierProvider<FavouriteProvider>(
            create: (context) => FavouriteProvider(),
          ),
          ChangeNotifierProvider<CardProvider>(
            create: (context) => CardProvider(),
          ),

          ChangeNotifierProvider<AddressesProvider>(
            create: (context) => AddressesProvider(),
          ),
          ChangeNotifierProvider<CartProvider>(
            create: (context) => CartProvider(),
          ),
        ],
        child: ScreenUtilInit(
            designSize: Size(375, 812),
            minTextAdapt: true,
            builder: (context, child) {
              return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  theme: ThemeData(

                    appBarTheme: AppBarTheme(
                      elevation: 0,
                      backgroundColor: Colors.transparent,
                      iconTheme: IconThemeData(color: Colors.black),
                      titleTextStyle: GoogleFonts.poppins(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                  initialRoute: '/launch_screen',
                  routes: {
                    '/launch_screen': (context) => const LaunchScreen(),
                    '/on_boarding_screen': (context) =>
                        const OnBoardingScreen(),
                    '/login_screen': (context) => const LoginScreen(),
                    '/register_screen': (context) => RegisterScreen(),
                    '/verification_screen': (context) => VerificationScreen(),
                    '/verification_edit_mobile_screen': (context) => VerificationEditMobileScreen(),
                    '/home_screen': (context) => HomeScreen(),
                    '/bottom_navigation_screen': (context) =>
                        BottomNavigationScreen(),
                    '/category_screen': (context) => CategoryScreen(),
                    '/product_screen': (context) => ProductScreen(),
                    '/forget_password_screen': (context) => ForgetPassword(),
                    '/notification_screen': (context) => NotificationScreen(),
                    '/profile_screen': (context) =>ProfileScreen(),
                    '/reset_password_screen': (context) =>ResetPasswordScreen(),
                    //'/details_screen': (context) =>DetailsScreen(productId: 5,),
                    '/new_password_screen': (context) =>NewPassword(),
                    '/contact_us_screen': (context) =>ContactUs(),
                    '/order_details_screen' : (context) =>OrderDetails(),
                    '/addresses_screen': (context) =>  AddressesListScreen(),

                    '/payment_card_list_screen': (context) =>PaymentCardListScreen(),
                    '/payment_card_screen': (context) =>Payment_card_screen(),
                    '/cart_screen': (context) =>CartScreen(),
                    '/cart_submit': (context) =>CartSubmit(),
                    '/order_screen': (context) =>OrdersScreen(),

                  });
            }));
  }
}
