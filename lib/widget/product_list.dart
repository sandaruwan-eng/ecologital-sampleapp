import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sampleapp/constant/widgets_constant.dart';
import 'package:sampleapp/controller/providers.dart';
import 'package:sampleapp/models/product.dart';
import 'package:sampleapp/style_guide/colors.dart';
import 'package:sampleapp/widget/widget.dart';

class ProductList extends StatelessWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 60 * WidgetsConstant.height),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 30.0 * WidgetsConstant.width),
            child: const Text(
              'Most Popular',
              style: TextStyle(color: Colors.black, fontSize: 19.0),
            ),
          ),
          Consumer(builder: (context, ref, _) {
            AsyncValue<Product> productList = ref.watch(productListProvider);

            return productList.when(
                data: (list) {
                  return Consumer(builder: (context, ref, _) {
                    List<Result> filterList = [];
                    final itemCategoryName =
                        ref.watch(itemCategoryProvider.state).state;
                    if (itemCategoryName == "All Product") {
                      filterList = list.result;
                    } else {
                      filterList = list.result
                          .where((item) =>
                              (item.category.contains(itemCategoryName)))
                          .toList();
                    }

                    return SizedBox(
                      height: 250 * WidgetsConstant.height,
                      child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: filterList.length,
                          itemBuilder: (BuildContext context, int index) =>
                              ProductListItem(
                                productItem: filterList[index],
                                itemThemeColor: index % 2 == 0
                                    ? guitarThemeColor
                                    : pianoThemeColor,
                              )),
                    );
                  });
                },
                loading: () => Padding(
                      padding:
                          EdgeInsets.only(top: 100.0 * WidgetsConstant.height),
                      child: const Center(child: CircularProgressIndicator()),
                    ),
                error: (e, stackTrace) {
                  return const Center(child: Text("error"));
                });
          }),
        ],
      ),
    );
  }
}
