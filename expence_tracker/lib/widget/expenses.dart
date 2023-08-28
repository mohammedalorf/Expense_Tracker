import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:expence_tracker/models/expanses.dart';
import 'package:expence_tracker/widget/list/epenesesList.dart';
import 'package:expence_tracker/widget/newExpenses.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

List<Expanses> lastMonuthExpanses = [
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

class _ExpensesState extends State<Expenses> {
  void addexpenses(Expanses expense) {
    setState(() {
      lastMonuthExpanses.add(expense);
    });
  }

  void deletexpenses(Expanses expense) {
    setState(() {
      lastMonuthExpanses.remove(expense);
    });
  }

  void _openlayout() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) => Newexpenses(
        addexpens: addexpenses,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Track your expenses'),
        actions: [
          IconButton(onPressed: _openlayout, icon: const Icon(Icons.add))
        ],
      ),
      body: Column(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          // ignore: prefer_const_constructors
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: const Text(
              'Chart',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
              child: ExpansesList(
            lastMonuthExpanses,
            removeexpense: deletexpenses,
          ))
        ],
      ),
    );
  }
}
