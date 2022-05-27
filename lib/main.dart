import 'package:big_cart/app/app.router.dart';
import 'package:big_cart/app/locator.dart';
import 'package:big_cart/constants/asset_constants.dart';
import 'package:big_cart/views/home/home_view.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

void main() {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    precacheImage(AssetImage(AssetConstants.splashScreenBackground), context);
    return MaterialApp(
      title: 'Big Cart',
      theme: ThemeData(),
      debugShowCheckedModeBanner: false,
      home: HomeView(),
      navigatorKey: StackedService.navigatorKey,
      onGenerateRoute: StackedRouter().onGenerateRoute,
    );
  }
}
