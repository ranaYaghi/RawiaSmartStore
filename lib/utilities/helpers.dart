import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

mixin Helpers {
  void showSnackBar(BuildContext context,
      {required String message, bool error = false}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: GoogleFonts.poppins(),

        ),

        backgroundColor: error ? Colors.red.shade700 : Colors.blue.shade100,
        duration: Duration(seconds: 3),
        dismissDirection: DismissDirection.horizontal
        ,
      ),
    );
  }
}
