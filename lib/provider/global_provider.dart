import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/cupertino.dart';

import '../modals/contect_modal.dart';

class global_pro extends ChangeNotifier {
  File? imag;
  bool isIos = false;
  int selected_page = 0;
  bool profile = false;
  bool themeisdark = false;
  File? profileImage;
  DateTime? inDate = DateTime.now();
  TimeOfDay Time = TimeOfDay.now();
  List<cuntect> countect = [];

  image_piker(File n) {
    imag = n;
    notifyListeners();
  }

  plyform_cunvert(bool n) {
    isIos = n;
    notifyListeners();
  }

  chenge_page(int n) {
    selected_page = n;
    notifyListeners();
  }

  onProfile(bool n) {
    profile = n;
    notifyListeners();
  }

  chengeTheme(bool n) {
    themeisdark = n;
    notifyListeners();
  }

  proimage(File n) {
    profileImage = n;
    notifyListeners();
  }

  pike_date(DateTime n) {
    inDate = n;
    notifyListeners();
  }

  pike_time(TimeOfDay n) {
    Time = n;
    notifyListeners();
  }

  add_contect(cuntect n) {
    countect.add(n);
    notifyListeners();
  }

  remove_contect(cuntect n) {
    countect.remove(n);
    notifyListeners();
  }
}
