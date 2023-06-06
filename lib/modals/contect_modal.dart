import 'dart:io';

import 'package:flutter/material.dart';

class cuntect {
  final File image;
  final String name;
  final int number;
  final String chat;
  final DateTime date;
  final TimeOfDay time;

  cuntect(
      {required this.image,
      required this.name,
      required this.number,
      required this.chat,
      required this.date,
      required this.time});
}
