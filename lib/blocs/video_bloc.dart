import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class VideoBloc extends ChangeNotifier {
  bool inVideoScreen = false;

  void inVideo() {
    inVideoScreen = true;
    notifyListeners();
  }
   void outOfVideo() {
    inVideoScreen = false;
    notifyListeners();
  }
}
