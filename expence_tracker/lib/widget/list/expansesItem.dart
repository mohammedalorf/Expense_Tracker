import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:expence_tracker/models/expanses.dart';

class ExpansesItem extends StatelessWidget {
  ExpansesItem(this.expansesIteam, {super.key});
  Expanses expansesIteam;
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(expansesIteam.titel),
            Row(
              children: [
                Text('\$${expansesIteam.amount.toStringAsFixed(2)}'),
                Spacer(),
                Row(
                  children: [
                    Icon(Icons.alarm),
                    Text(expansesIteam.date.toString())
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
