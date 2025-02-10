import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String? productImage;
  final String? productTitle;
  final String? productPrice;
  final int? productId;
  final VoidCallback? onPressed;
  const ProductCard({
    super.key,
    required this.productId,
    required this.productImage,
    required this.productTitle,
    required this.productPrice,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: const EdgeInsets.all(20),
      color: Theme.of(context).cardColor,
      elevation: 2,
      onPressed: onPressed,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: SizedBox(
              height: 100,
              width: 100,
              child: Hero(
                tag: productId.toString(),
                child: Image.network(productImage!),
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productTitle!,
                  style: Theme.of(context).textTheme.titleLarge,
                  maxLines: 1,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  productPrice!,
                  style: Theme.of(context).textTheme.titleSmall,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
