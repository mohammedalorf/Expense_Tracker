import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:expence_tracker/models/expanses.dart';
import 'package:expence_tracker/widget/list/epenesesList.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Expanses> lastMonuthExpanses = [
    Expanses(
        titel: 'restant',
        date: DateTime.now(),
        amount: 32.45,
        catagory: Catagory.food),
    Expanses(
        titel: 'restant',
        date: DateTime.now(),
        amount: 32.45,
        catagory: Catagory.food)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          Text('Chart'),
          Expanded(child: ExpansesList(lastMonuthExpanses))
        ],
      ),
    );
  }
}
