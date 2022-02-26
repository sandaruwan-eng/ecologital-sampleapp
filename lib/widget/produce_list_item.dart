import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sampleapp/constant/widgets_constant.dart';
import 'package:sampleapp/models/product.dart';
import 'package:sampleapp/screens/product_details_screen.dart';

class ProductListItem extends StatelessWidget {
  const ProductListItem({Key? key, required this.productItem})
      : super(key: key);
  final Result productItem;
  @override
  Widget build(BuildContext context) {
    final _appTheme = Theme.of(context);
    return GestureDetector(
      onTap: () {
        // Navigator.pushNamed(context, '/second', arguments: productItem);
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ProductDetailsScreen(
                  arguments: productItem,
                )));
      },
      child: Padding(
        padding: EdgeInsets.only(
            left: 30 * WidgetsConstant.width,
            top: 30.0 * WidgetsConstant.height),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
            borderRadius: const BorderRadius.all(
              Radius.circular(35),
            ),
          ),
          width: 170 * WidgetsConstant.width,
          child: Padding(
            padding: EdgeInsets.all(15.0 * WidgetsConstant.width),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Row(
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.only(top: 10.0 * WidgetsConstant.height),
                      child: SizedBox(
                        width: 100.0 * WidgetsConstant.width,
                        child: Text(
                          productItem.model,
                          style: _appTheme.textTheme.button!
                              .merge(const TextStyle(color: Colors.black)),
                        ),
                      ),
                    ),
                    const Spacer(),
                    Icon(
                      Icons.favorite,
                      size: 26 * WidgetsConstant.height,
                      color: Colors.white,
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20 * WidgetsConstant.height),
                  child: SizedBox(
                    height: 130 * WidgetsConstant.height,
                    child: Image.network(
                      productItem.image,
                      scale: 6,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
