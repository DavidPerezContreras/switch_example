import 'package:flutter/material.dart';

class DarkMode extends ValueNotifier{
  DarkMode(super.value);
  
  ValueNotifier<bool> darkModeNotifier = ValueNotifier<bool>(false);


  onSwitch(bool value){
    darkModeNotifier.value=value;
    notifyListeners();
  }
}