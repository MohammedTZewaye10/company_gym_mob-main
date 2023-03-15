import 'package:flutter/material.dart';

class PlayVideoProvider extends ChangeNotifier {
  int playing = -1;

  void setPlaying(int value) {
    playing = value;
    notifyListeners();
  }
}
