import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sampleapp/constant/widgets_constant.dart';
import 'package:sampleapp/controller/providers.dart';

class CategoryListItem extends ConsumerWidget {
  const CategoryListItem(
      {Key? key,
      required this.buttonName,
      required this.buttonIcon,
      required this.buttonColor})
      : super(key: key);

  final String buttonName;
  final String buttonIcon;
  final Color buttonColor;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _appTheme = Theme.of(context);
    return Padding(
      padding: EdgeInsets.only(
          top: 25 * WidgetsConstant.height, left: 15 * WidgetsConstant.width),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Stack(
          children: <Widget>[
            Positioned.fill(
              child: Container(color: buttonColor),
            ),
            TextButton(
              style: TextButton.styleFrom(
                padding: EdgeInsets.only(
                    top: 1.0 * WidgetsConstant.height,
                    bottom: 1.0 * WidgetsConstant.height,
                    left: 10.0 * WidgetsConstant.width,
                    right: 10.0 * WidgetsConstant.width),
                primary: Colors.grey,
              ),
              onPressed: () {
                ref.read(itemCategoryProvider.state).state = buttonName;
              },
              child: Row(
                children: [
                  Image.asset(
                    buttonIcon,
                    scale: 4.5,
                    color: Colors.white,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10 * WidgetsConstant.width),
                    child: Text(
                      buttonName,
                      style: _appTheme.textTheme.button!
                          .merge(const TextStyle(color: Colors.white)),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
