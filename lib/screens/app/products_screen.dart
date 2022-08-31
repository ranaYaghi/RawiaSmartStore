import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:smart_store/providers/product_provider.dart';
import 'package:smart_store/widgets/product_card.dart';

import '../../utilities/style_constants.dart';
import '../../widgets/product_gridview.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  ListView(
        children: [
      ProductGridView(),
      ],





    );
  }
}
