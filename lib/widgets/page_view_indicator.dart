import 'package:flutter/material.dart';

import '../utilities/style_constants.dart';

class PageViewIndicator extends StatelessWidget {
  const PageViewIndicator({
    Key? key,
    required this.isCurrentPage,
    this.marginEnd = 0,
  }) : super(key: key);

  final bool isCurrentPage;
  final double marginEnd;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsetsDirectional.only(end: marginEnd),
      height: 4,
      width: 18,
      decoration: BoxDecoration(
        color: isCurrentPage ?StyleConstants.thirdColor: StyleConstants.mainColor,
        borderRadius: BorderRadius.circular(2),
      ),
    );
  }
}
