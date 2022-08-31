import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_store/widgets/product_card.dart';

import '../providers/product_provider.dart';
class ProductGridView extends StatelessWidget {
  const ProductGridView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: 10,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,

        childAspectRatio: 120 / 200,


      ),
      itemBuilder: (context, index) {
        return ProductCard(product: Provider.of<ProductProvider>(context).products[index],);
      },
    );
  }
}