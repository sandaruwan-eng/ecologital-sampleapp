import 'package:flutter/material.dart';
import 'package:sampleapp/constant/widgets_constant.dart';
import 'package:sampleapp/style_guide/colors.dart';
import 'package:sampleapp/style_guide/image_assets.dart';
import 'package:sampleapp/widget/widget.dart';

class ProductCategoryList extends StatelessWidget {
  const ProductCategoryList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> buttonName = const ['All Product', 'Guitar', 'Piano', 'Drums'];
    List<String> buttonIcon = const [allInstrument, guitar, piano, drum];
    List<Color> buttonColors = const [
      allButtonColor,
      guitarButtonColor,
      pianoButtonColor,
      drumsButtonColor
    ];
    return Padding(
      padding: EdgeInsets.only(top: 70 * WidgetsConstant.height),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 30.0 * WidgetsConstant.width),
            child: const Text(
              'By Category',
              style: TextStyle(color: Colors.black54, fontSize: 19.0),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20 * WidgetsConstant.width),
            child: SizedBox(
              height: 80 * WidgetsConstant.height,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: buttonName.length,
                itemBuilder: (BuildContext context, int index) =>
                    CategoryListItem(
                  buttonName: buttonName[index],
                  buttonIcon: buttonIcon[index],
                  buttonColor: buttonColors[index],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
