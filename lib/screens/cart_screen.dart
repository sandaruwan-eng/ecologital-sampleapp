import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sampleapp/constant/widgets_constant.dart';
import 'package:sampleapp/controller/providers.dart';
import 'package:sampleapp/models/product.dart';
import 'package:sampleapp/style_guide/colors.dart';
import 'package:sampleapp/widget/widget.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _appTheme = Theme.of(context);
    return Scaffold(
      backgroundColor: backGroundColor,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: backGroundColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Consumer(
        builder: (context, ref, _) {
          // final ProductListController controller = ref.watch(cartListProvider.notifier);
          final cartList = ref.watch(cartListProvider);
          return cartList.isEmpty
              ? _emptyScreen(_appTheme, context)
              : _cartListScreen(_appTheme, cartList);
        },
      ),
    );
  }

  Widget _cartListScreen(ThemeData _appTheme, List<Result> cartList) {
    double totalPrice = 0.0;
    for (var item in cartList) {
      totalPrice += item.price;
    }

    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: cartList.length + 1,
                itemBuilder: (BuildContext context, int index) {
                  if (index == cartList.length) {
                    return Padding(
                      padding:
                          EdgeInsets.only(top: 70 * WidgetsConstant.height),
                      child: Column(
                        children: <Widget>[
                          Divider(
                            height: 20,
                            thickness: 2,
                            indent: 30 * WidgetsConstant.width,
                            endIndent: 30 * WidgetsConstant.width,
                            color: primaryColor,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: 35 * WidgetsConstant.height,
                                left: 30 * WidgetsConstant.width,
                                right: 30 * WidgetsConstant.width),
                            child: Row(
                              children: <Widget>[
                                Text(
                                  "Total",
                                  style: _appTheme.textTheme.headline4!
                                      .merge(const TextStyle(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w500,
                                  )),
                                ),
                                const Spacer(),
                                Text(
                                  "Rs. ${totalPrice.toString()}",
                                  style: _appTheme.textTheme.headline4!
                                      .merge(const TextStyle(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w500,
                                  )),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  } else {
                    return ProductCard(
                      product: cartList[index],
                      cartItemThemeColor:
                          index % 2 == 0 ? guitarThemeColor : pianoThemeColor,
                    );
                  }
                }),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 10 * WidgetsConstant.height),
            child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: CommonButton(
                buttonTitle: "Check out",
                callBack: () {},
              ),
            ),
          ),
        ]);
  }

  Widget _emptyScreen(ThemeData _appTheme, BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(
              top: 150 * WidgetsConstant.height,
              bottom: 30 * WidgetsConstant.height),
          child: const Icon(
            Icons.add_shopping_cart,
            size: 150,
            color: primaryColor,
          ),
        ),
        Text(
          "Your cart is currently",
          style: _appTheme.textTheme.headline5!.merge(const TextStyle(
            color: Colors.grey,
          )),
        ),
        Text(
          "empty !",
          style: _appTheme.textTheme.headline5!.merge(const TextStyle(
            color: Colors.grey,
          )),
        ),
        Expanded(
          child: Align(
            alignment: FractionalOffset.bottomCenter,
            child: CommonButton(
              buttonTitle: "Brows items",
              callBack: () => Navigator.of(context).pop(),
            ),
          ),
        ),
      ],
    );
  }
}
