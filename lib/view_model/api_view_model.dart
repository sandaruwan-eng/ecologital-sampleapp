import 'dart:async';
import 'package:sampleapp/constant/url_constant.dart';
import 'package:sampleapp/models/product.dart';
import 'package:sampleapp/services/api_service.dart';

Future<Product> getProductList() async {
  try {
    String dataBody = await fetchData(UrlConstant.GET_PRODUCT_LIST_URL);
    final product = productFromJson(dataBody);
    return product;
  } on Exception catch (exception) {
    // ignore: avoid_print
    print(exception);
    rethrow;
  } catch (error) {
    rethrow;
  }
}
