import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sampleapp/constant/widgets_constant.dart';
import 'package:sampleapp/controller/product_list.dart';
import 'package:sampleapp/controller/providers.dart';
import 'package:sampleapp/models/product.dart';

class ProductCard extends StatelessWidget {
  const ProductCard(
      {Key? key, required this.product, required this.cartItemThemeColor})
      : super(key: key);
  final Result product;
  final Color cartItemThemeColor;
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
          color: cartItemThemeColor,
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 20 * WidgetsConstant.width),
              child: Center(
                child: SizedBox(
                  height: 100 * WidgetsConstant.height,
                  width: 100 * WidgetsConstant.height,
                  child: Image.network(
                    product.image,
                    scale: 9,
                  ),
                ),
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
                    product.model,
                    style: _appTheme.textTheme.headline5!.merge(const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w800)),
                  ),
                ),
                Text(
                  "Rs ${product.price.toString()}",
                  style: _appTheme.textTheme.headline5!.merge(const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w800)),
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
