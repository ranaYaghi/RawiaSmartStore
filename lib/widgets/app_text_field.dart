import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    Key? key,
     this.hint,
     this.prefixIcon,
     this.focusedBorderColor = Colors.grey,
    required this.controller,
     this.keyboardType,
     this.suffixIcon,
    this.errorString,
 this.maxLines,
    this.obscureText = false
  }) : super(key: key);

  final String? hint;
  final IconData? prefixIcon;
  final TextInputType? keyboardType;
  final TextEditingController controller;
  final Color focusedBorderColor;
  final Widget? suffixIcon;
  final bool obscureText;
  final String? errorString;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return TextField(

      // maxLines: maxLines,
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,

      style: GoogleFonts.poppins( fontSize: 13.sp),
      decoration: InputDecoration(
          errorText: errorString,
          errorStyle: GoogleFonts.nunito(),
          errorMaxLines: 1,
        contentPadding: EdgeInsets.zero,
        hintText: hint,
        hintMaxLines: 1,
        hintStyle: GoogleFonts.poppins(fontSize: 13.sp),
        prefixIcon: Icon(prefixIcon),
        suffixIcon: suffixIcon,
        enabledBorder: buildOutlineInputBorder(),
        focusedBorder: buildOutlineInputBorder(color: focusedBorderColor),
        errorBorder: buildOutlineInputBorder(color:Colors.red.shade600  ),
        focusedErrorBorder: buildOutlineInputBorder(color:Colors.red.shade600 )

      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder({Color color =Colors.grey}) {
    return OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(color: color));
  }
}
