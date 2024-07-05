import 'package:flutter/material.dart';

class MyProvider extends ChangeNotifier{
  //changeNotifier: inform me with the recent changes
  String? myPlatform;
  Uri? myUrl;
  @override
  void notifyListeners() {
    // TODO: implement notifyListeners
    super.notifyListeners();
  }
  //all the consumers of this provider will act in accordance to the change
}