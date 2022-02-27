import 'package:flutter/material.dart';
import 'package:sampleapp/constant/widgets_constant.dart';
import 'package:sampleapp/style_guide/colors.dart';
import 'package:sampleapp/widget/widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _appTheme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        const Profile(),
        Padding(
          padding: EdgeInsets.only(
              left: 30 * WidgetsConstant.width,
              top: 10 * WidgetsConstant.height),
          child: Row(
            children: [
              Text(
                "Hello,",
                style: _appTheme.textTheme.subtitle1!
                    .merge(const TextStyle(color: disabledColor)),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
              left: 30 * WidgetsConstant.width,
              top: 15 * WidgetsConstant.height,
              bottom: 15 * WidgetsConstant.height),
          child: Row(
            children: [
              Text(
                "Sudesh Kumara",
                style: _appTheme.textTheme.headline6!
                    .merge(const TextStyle(color: Colors.black)),
              ),
            ],
          ),
        ),
        const SearchBar(),
        const ProductCategoryList(),
        const ProductList(),
      ],
    );
  }
}
