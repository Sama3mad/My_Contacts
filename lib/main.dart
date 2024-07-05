import 'package:first_app/my_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'my_contacts.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyProvider(),
      child: MaterialApp(
        //for me to be able to access the provider, I should wrap the material app which is the root of all pages with widget
        debugShowCheckedModeBanner: false,
        home: MyContacts(),
      ),
    );
  }
}