import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sampleapp/controller/product_list.dart';
import 'package:sampleapp/models/product.dart';
import 'package:sampleapp/view_model/api_view_model.dart';

final productListProvider = FutureProvider(
  (ref) => getProductList(),
);

final cartListProvider =
    StateNotifierProvider<ProductListController, List<Result>>(
        (ref) => ProductListController());

final itemCategoryProvider = StateProvider<String>((ref) => "all product");
