import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sampleapp/constant/widgets_constant.dart';
import 'package:sampleapp/controller/product_list.dart';
import 'package:sampleapp/controller/providers.dart';
import 'package:sampleapp/models/product.dart';
import 'package:sampleapp/style_guide/colors.dart';
import 'package:sampleapp/style_guide/image_assets.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({Key? key, required this.product}) : super(key: key);
  final Result product;
  @override
  Widget build(BuildContext context) {
    final _appTheme = Theme.of(context);
    return Padding(
      padding: EdgeInsets.only(
          top: 30 * WidgetsConstant.height,
          left: 30 * WidgetsConstant.width,
          right: 30 * WidgetsConstant.width),
      child: Container(
        decoration: BoxDecoration(
          color: primaryColor,
          border: Border.all(
            color: Colors.white,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(30),
          ),
        ),
        height: 160 * WidgetsConstant.height,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Image.network(
                product.image,
                scale: 9,
              ),
            ),
            const Spacer(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 20 * WidgetsConstant.height),
                  child: Text(
                    product.category,
                    style: _appTheme.textTheme.headline6!
                        .merge(const TextStyle(color: Colors.white)),
                  ),
                ),
                Text(
                  product.brand,
                  style: _appTheme.textTheme.headline6!
                      .merge(const TextStyle(color: Colors.white)),
                ),
              ],
            ),
            const Spacer(),
            Consumer(builder: (context, ref, _) {
              final ProductListController controller =
                  ref.watch(cartListProvider.notifier);
              return IconButton(
                icon: const Icon(Icons.close, color: Colors.white),
                onPressed: () => controller.deleteProduct(product),
              );
            }),
          ],
        ),
      ),
    );
  }
}