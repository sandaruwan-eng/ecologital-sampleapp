import 'package:flutter/material.dart';
import 'package:sampleapp/constant/widgets_constant.dart';
import 'package:sampleapp/style_guide/colors.dart';

class CommonButton extends StatelessWidget {
  const CommonButton(
      {Key? key, required this.buttonTitle, required this.callBack})
      : super(key: key);
  final String buttonTitle;
  final VoidCallback callBack;

  @override
  Widget build(BuildContext context) {
    final _appTheme = Theme.of(context);
    return Padding(
      padding: EdgeInsets.only(
          left: 30.0 * WidgetsConstant.width,
          right: 30.0 * WidgetsConstant.width),
      child: ButtonTheme(
        minWidth: double.infinity,
        height: 50.0 * WidgetsConstant.height,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        buttonColor: primaryColor,
        child: RaisedButton(
          onPressed: () => callBack(),
          child: Text(
            buttonTitle,
            style: _appTheme.textTheme.bodyText1!
                .merge(const TextStyle(color: Colors.white)),
          ),
        ),
      ),
    );
  }
}
