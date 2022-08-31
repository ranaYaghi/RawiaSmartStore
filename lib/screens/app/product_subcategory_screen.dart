import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widgets/product_gridview.dart';

class ProductSubcategoryScreen extends StatelessWidget {
  const ProductSubcategoryScreen({Key? key , required this.SubcategoryId}) : super(key: key);

  final int SubcategoryId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:  ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.w , vertical: 10.h),
      children: [
      ProductGridView(),
    ],
    ));
  }
}
