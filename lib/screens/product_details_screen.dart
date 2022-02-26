import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sampleapp/models/product.dart';
import 'package:sampleapp/widget/widget.dart';
import 'package:badges/badges.dart';

class ProductDetailsScreen extends StatelessWidget {
  ProductDetailsScreen({Key? key, required this.arguments}) : super(key: key);

  final Result arguments;

  final likeProvider = StateProvider<bool>((ref) => false);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.share, color: Colors.white),
            onPressed: () => print("press"),
          ),
          Consumer(builder: (context, ref, _) {
            final isLike = ref.watch(likeProvider.state).state;
            return IconButton(
              icon: Icon(Icons.favorite,
                  color: isLike ? Colors.red : Colors.white),
              onPressed: () => ref.read(likeProvider.state).state = !isLike,
            );
          }),
          Badge(
            badgeContent: const Text('3'),
            position: BadgePosition.topEnd(top: 3, end: 3),
            showBadge: true,
            child: IconButton(
              icon: const Icon(Icons.shopping_cart, color: Colors.white),
              onPressed: () => Navigator.pushNamed(context, '/cart_screen'),
            ),
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ProductScreenTopImage(
              productItem: arguments,
            ),
          ),
          ProductScreenBottomPart(
            productItem: arguments,
          ),
        ],
      ),
    );
  }
}
