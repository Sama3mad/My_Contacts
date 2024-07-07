import 'package:flutter/material.dart';

class MyProvider extends ChangeNotifier{
  //changeNotifier: inform me with the recent changes
  String? _myPlatform;
  Uri? _myUrl;
  //this sign _ means that it is a private variable that can't be without getters and setters
  //another condition in dart to make the members private is to make them in a sigle file 
  void setMyPlatform(value){
    _myPlatform = value;
  }

  void setMyUrl(value){
    _myUrl = value;
  }

  String? getMyPlatform() => _myPlatform;

  Uri? getMyUrl() => _myUrl;

  @override
  void notifyListeners() {
    // TODO: implement notifyListeners
    super.notifyListeners();
  }
  //all the consumers of this provider will act in accordance to the change
}