import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sampleapp/constant/widgets_constant.dart';
import 'package:sampleapp/controller/product_list.dart';
import 'package:sampleapp/controller/providers.dart';
import 'package:sampleapp/models/product.dart';
import 'package:sampleapp/widget/widget.dart';

class ProductScreenBottomPart extends StatelessWidget {
  const ProductScreenBottomPart({Key? key, required this.productItem})
      : super(key: key);

  final Result productItem;
  @override
  Widget build(BuildContext context) {
    final _appTheme = Theme.of(context);
    return Expanded(
      child: Align(
        alignment: FractionalOffset.bottomCenter,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Colors.white,
            ),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          height: 350 * WidgetsConstant.height,
          width: double.infinity,
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(
                    left: 30 * WidgetsConstant.width,
                    top: 20 * WidgetsConstant.height),
                child: Row(
                  children: [
                    Text(
                      productItem.model,
                      style: _appTheme.textTheme.headline4!.merge(
                          const TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.w500)),
                    ),
                  ],
                ),
              ),
              ProductDetailBottomItem(
                productTitle: "Brand",
                productDetailName: productItem.brand,
              ),
              ProductDetailBottomItem(
                productTitle: "Price",
                productDetailName: productItem.price.toString(),
              ),
              ProductDetailBottomItem(
                productTitle: "Color",
                productDetailName: productItem.colour,
              ),
              ProductDetailBottomItem(
                productTitle: "Weight",
                productDetailName: productItem.weight,
              ),
              Consumer(builder: (context, ref, _) {
                final ProductListController controller =
                    ref.watch(cartListProvider.notifier);
                return Padding(
                  padding: EdgeInsets.only(top: 50 * WidgetsConstant.height),
                  child: CommonButton(
                    buttonTitle: "Add to Cart",
                    callBack: () {
                      controller.addProduct(productItem);
                    },
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
