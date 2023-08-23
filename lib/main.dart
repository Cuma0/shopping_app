import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'core/provider/cart_provider.dart';

import 'core/navigation/navigation_provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => NavigationProvider.instance),
    ChangeNotifierProvider(create: (_) => CartProvider()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: NavigationProvider.of(context).onGenerateRoute,
      navigatorKey: NavigationProvider.of(context).navigatorKey,
      title: 'Shopping App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
