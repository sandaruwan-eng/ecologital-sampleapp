import 'package:flutter/material.dart';
import 'package:sampleapp/constant/widgets_constant.dart';
import 'package:sampleapp/models/product.dart';
import 'package:sampleapp/screens/product_details_screen.dart';

class ProductListItem extends StatelessWidget {
  const ProductListItem(
      {Key? key, required this.productItem, required this.itemThemeColor})
      : super(key: key);
  final Result productItem;
  final Color itemThemeColor;
  @override
  Widget build(BuildContext context) {
    final _appTheme = Theme.of(context);
    return GestureDetector(
      onTap: () {
        var arguments = Map();
        arguments['product'] = productItem;
        arguments['itemColor'] = itemThemeColor;
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ProductDetailsScreen(
                  arguments: arguments,
                )));
      },
      child: Padding(
        padding: EdgeInsets.only(
            left: 30 * WidgetsConstant.width,
            top: 30.0 * WidgetsConstant.height),
        child: Container(
          decoration: BoxDecoration(
            color: itemThemeColor,
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
                              .merge(const TextStyle(color: Colors.black54)),
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
