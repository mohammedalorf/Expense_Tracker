import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

var format = DateFormat.yMd();

final uuid = Uuid();

enum Catagory { travel, saving, food, work }

const catagoryIcons = {
  Catagory.travel: Icons.flight_takeoff,
  Catagory.food: Icons.food_bank,
  Catagory.saving: Icons.attach_money,
  Catagory.work: Icons.work
};

class Expanses {
  Expanses(
      {required this.catagory,
      required this.amount,
      required this.titel,
      required this.date})
      : id = uuid.v4();
  String id;
  String titel;
  double amount;
  DateTime date;
  Catagory catagory;

  String get dateformated {
    return format.format(date);
  }
}
