import 'package:flutter/material.dart';
import 'package:sampleapp/constant/widgets_constant.dart';
import 'package:sampleapp/models/product.dart';

class ProductScreenTopImage extends StatelessWidget {
  const ProductScreenTopImage({Key? key, required this.productItem})
      : super(key: key);
  final Result productItem;
  @override
  Widget build(BuildContext context) {
    return Image.network(
      productItem.image,
      scale: 4 * WidgetsConstant.height,
    );
  }
}
