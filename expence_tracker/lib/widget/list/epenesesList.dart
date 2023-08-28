import 'package:expence_tracker/models/expanses.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'expansesItem.dart';

class ExpansesList extends StatelessWidget {
  ExpansesList(this.expanses, {super.key, required this.removeexpense});
  final void Function(Expanses expanse) removeexpense;
  List<Expanses> expanses;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: expanses.length,
        itemBuilder: ((context, index) {
          return Dismissible(
              key: ValueKey(expanses[index]),
              onDismissed: (direction) {
                removeexpense(expanses[index]);
              },
              child: ExpansesItem(expanses[index]));
        }));
  }
}
