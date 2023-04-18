import 'package:flutter/material.dart';

class DarkMode extends ValueNotifier{
  DarkMode(super.value);
  


  onSwitch(bool value){
    value=value;
    notifyListeners();
  }
}