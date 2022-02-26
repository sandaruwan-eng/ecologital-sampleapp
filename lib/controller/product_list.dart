import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sampleapp/models/product.dart';

class ProductListController extends StateNotifier<List<Result>> {
  ProductListController() : super([]);

  addProduct(Result product) {
    state = [...state, product];
  }

  deleteProduct(Result product) {
    state = state.where((_product) => _product.id != product.id).toList();
  }
}
