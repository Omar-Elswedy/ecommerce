import 'package:ecommerce/product/view/screen/product_details_screen.dart';
import 'package:ecommerce/product/view/widget/product_card.dart';
import 'package:ecommerce/product/view_model/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  late ProductProvider? productProvider;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    productProvider = ProductProvider();
    productProvider!.getFavoriteProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Favorite List',
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      body: ChangeNotifierProvider(
        create: (BuildContext context) => productProvider,
        child: Consumer<ProductProvider>(
          builder: (_, value, child) {
            if (value.waiting) {
              return const CircularProgressIndicator();
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
                    productId: value.favoriteProducts![index].id,
                    productImage: value.favoriteProducts![index].image,
                    productTitle: value.favoriteProducts![index].title,
                    productPrice:
                        value.favoriteProducts![index].price.toString(),
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductDetailsScreen(
                          product: value.favoriteProducts![index],
                        ),
                      ),
                    ),
                  );
                },
                itemCount: value.favoriteProducts!.length,
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
