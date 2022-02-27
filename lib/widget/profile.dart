import 'package:flutter/material.dart';
import 'package:sampleapp/constant/widgets_constant.dart';
import 'package:sampleapp/style_guide/colors.dart';
import 'package:sampleapp/style_guide/image_assets.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _appTheme = Theme.of(context);
    return Padding(
      padding: EdgeInsets.only(
          top: 70 * WidgetsConstant.height, left: 30 * WidgetsConstant.width),
      child: Row(
        children: [
          Text(
            "BLISS",
            style: _appTheme.textTheme.headline5!
                .merge(const TextStyle(color: primaryColor)),
          ),
          const Spacer(),
          Padding(
            padding: EdgeInsets.only(right: 30 * WidgetsConstant.width),
            child: const CircleAvatar(
              backgroundColor: Colors.white,
              radius: 26,
              child: CircleAvatar(
                radius: 26,
                backgroundImage: AssetImage(profileImage),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
