import 'package:expence_tracker/models/expanses.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'expansesItem.dart';

class ExpansesList extends StatelessWidget {
  ExpansesList(this.expanses, {super.key});
  List<Expanses> expanses;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: expanses.length,
        itemBuilder: ((context, index) {
          return ExpansesItem(expanses[index]);
        }));
  }
}
