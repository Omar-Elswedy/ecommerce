import 'package:ecommerce/product/view/screen/favorite_screen.dart';
import 'package:ecommerce/product/view/screen/product_list_screen.dart';
import 'package:ecommerce/product/view/screen/settings_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = '/';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int? index = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> tabsList = [
      const ProductListScreen(),
      const FavoriteScreen(),
      const SettingsScreen(),
    ];

    return Scaffold(
      body: tabsList[index!],
      backgroundColor: Colors.transparent,
      bottomNavigationBar: BottomAppBar(
        padding: EdgeInsets.zero,
        child: BottomNavigationBar(
          selectedIconTheme: Theme.of(context).iconTheme.copyWith(size: 30),
          currentIndex: index!,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: 'ProductList',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Favorite',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Setting',
            )
          ],
          onTap: (value) {
            setState(() {
              index = value;
            });
          },
        ),
      ),
    );
  }
}
