import 'package:flutter/material.dart';
import 'package:portfolio/pages/home_page/home_page.dart';
import 'package:portfolio/providers/current_state.dart';
import 'package:provider/provider.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => CurrentState())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Port-folio-website",
        home: HomePage(),
      ),
    );
  }
}
