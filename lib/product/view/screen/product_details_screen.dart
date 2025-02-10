import 'package:ecommerce/product/model/data_model/product_details.dart';
import 'package:ecommerce/product/view_model/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

class ProductDetailsScreen extends StatefulWidget {
  final ProductDetails? product;
  const ProductDetailsScreen({
    super.key,
    this.product,
  });

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  late ProductProvider productProvider;
  int currentIndex = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    productProvider = ProductProvider();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SizedBox(
          width: 200,
          child: Text(
            widget.product!.title!,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Expanded(
                child: Stack(
                  alignment: Alignment.center,
                  fit: StackFit.expand,
                  children: [
                    SizedBox(
                      height: 150,
                      width: 150,
                      child: Hero(
                        tag: widget.product!.id.toString(),
                        child: Image.network(
                          widget.product!.image!,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Theme.of(context).cardColor,
                            borderRadius: BorderRadius.circular(20)),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              widget.product!.rating!.rate.toString(),
                            ),
                            const Icon(
                              Icons.star_rate_rounded,
                              color: Colors.amber,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.product!.category!,
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(color: Colors.grey),
                      maxLines: 1,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      widget.product!.title!,
                      style: Theme.of(context).textTheme.titleLarge,
                      maxLines: 1,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      widget.product!.description!,
                      style: Theme.of(context).textTheme.titleSmall,
                      maxLines: 3,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedIconTheme:
            Theme.of(context).iconTheme.copyWith(color: Colors.red, size: 30),
        currentIndex: currentIndex,
        onTap: (value) {
          setState(() {});
          currentIndex = value;
          productProvider.setFavoriteProduct(widget.product!);
          if (value == 1) showToast("Added to favorite", context: context);
        },
        items: [
          BottomNavigationBarItem(
            icon: Material(
              borderRadius: BorderRadius.circular(50),
              elevation: 2,
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Theme.of(context).cardColor),
                child: Text(
                  '${widget.product!.price!.toString()} EGP',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            ),
            label: 'Price',
          ),
          const BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'Favorite'),
        ],
      ),
    );
  }
}
