import 'dart:ffi';
import 'package:uuid/uuid.dart';

final uuid = Uuid();

enum Catagory { travel, saving, food, work }

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
}
