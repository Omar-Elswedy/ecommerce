import 'package:ecommerce/common/app_theme.dart';
import 'package:ecommerce/product/view/screen/home_screen.dart';
import 'package:ecommerce/product/view_model/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'common/shared_pref.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefs().init();
  runApp(
    ChangeNotifierProvider(
      create: (BuildContext context) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(builder: (_, value, child) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        darkTheme: AppTheme.darkTheme,
        theme: AppTheme.lightTheme,
        themeMode: Provider.of<ThemeProvider>(context).appThemeMode,
        routes: {
          HomeScreen.routeName: (context) => const HomeScreen(),
        },
        initialRoute: HomeScreen.routeName,
      );
    });
  }
}
