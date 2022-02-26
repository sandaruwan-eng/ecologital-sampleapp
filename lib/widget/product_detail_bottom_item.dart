import 'package:flutter/material.dart';
import 'package:sampleapp/constant/widgets_constant.dart';

class ProductDetailBottomItem extends StatelessWidget {
  const ProductDetailBottomItem(
      {Key? key, required this.productTitle, required this.productDetailName})
      : super(key: key);
  final String productTitle;
  final String productDetailName;
  @override
  Widget build(BuildContext context) {
    final _appTheme = Theme.of(context);
    return Padding(
      padding: EdgeInsets.only(
          right: 30 * WidgetsConstant.width,
          left: 30 * WidgetsConstant.width,
          top: 15 * WidgetsConstant.height),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: 210 * WidgetsConstant.width,
            child: Text(
              productTitle,
              style: _appTheme.textTheme.headline6!
                  .merge(const TextStyle(color: Colors.black)),
            ),
          ),
          Text(
            productDetailName,
            style: _appTheme.textTheme.headline6!.merge(const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w300,
            )),
          ),
        ],
      ),
    );
  }
}
