import 'package:ecommerce/product/view/screen/product_details_screen.dart';
import 'package:ecommerce/product/view/widget/product_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../view_model/product_provider.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  late ProductProvider productProvider;

  @override
  void initState() {
    super.initState();
    // TODO: implement initState
    productProvider = ProductProvider();
    productProvider.getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Products List',
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      body: ChangeNotifierProvider(
        create: (BuildContext context) => productProvider,
        child: Consumer<ProductProvider>(
          builder: (_, value, child) {
            if (value.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (value.errorMessage != null) {
              return Center(
                child: Text(
                  value.errorMessage.toString(),
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              );
            } else {
              return ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                itemBuilder: (context, index) {
                  return ProductCard(
                    productId: value.products![index].id,
                    productImage: value.products![index].image!,
                    productTitle: value.products![index].title!,
                    productPrice:
                        '${value.products![index].price!.toString()} EGP',
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductDetailsScreen(
                          product: value.products![index],
                        ),
                      ),
                    ),
                  );
                },
                itemCount: value.products!.length,
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(
                    height: 20,
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
