import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sampleapp/constant/widgets_constant.dart';
import 'package:sampleapp/controller/providers.dart';

class SearchBar extends ConsumerWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: EdgeInsets.only(
          top: 15.0 * WidgetsConstant.height,
          left: 30.0 * WidgetsConstant.width,
          right: 30.0 * WidgetsConstant.width),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Colors.grey,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        height: 55 * WidgetsConstant.height,
        child: Center(
          child: TextField(
            textAlign: TextAlign.left,
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Search Your Model',
                suffixIcon: const Icon(Icons.search),
                contentPadding: EdgeInsets.only(
                    left: 30 * WidgetsConstant.width,
                    top: 14 * WidgetsConstant.height)),
            onChanged: (val) {
              ref.read(itemCategoryProvider.state).state = val.trim();
            },
          ),
        ),
      ),
    );
  }
}
