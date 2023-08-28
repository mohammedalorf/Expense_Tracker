import 'package:expence_tracker/models/expanses.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Newexpenses extends StatefulWidget {
  const Newexpenses({super.key, required this.addexpens});
  final void Function(Expanses expanse) addexpens;

  @override
  State<Newexpenses> createState() => _NewexpensesState();
}

class _NewexpensesState extends State<Newexpenses> {
  final _titelContreller = TextEditingController();
  final _amountController = TextEditingController();
  var _dropbuttonvalue = Catagory.saving;
//this funcation is used in case one off the essential gaps is empty
  void _invaild() {
    final amountnumber = double.tryParse(_amountController.text);
    var amountnumberIsInvalid = amountnumber == null || amountnumber < 0;
    if (amountnumberIsInvalid == true ||
        _titelContreller.text.trim().isEmpty ||
        etime == null) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text('someting wrong happened'),
          content: Text('could you please '),
          actions: [
            ElevatedButton(
                onPressed: (() {
                  return Navigator.pop(ctx);
                }),
                child: const Text('OK'))
          ],
        ),
      );
    }

    widget.addexpens(Expanses(
        amount: amountnumber!,
        catagory: _dropbuttonvalue,
        date: etime!,
        titel: _titelContreller.text));
    Navigator.pop(context);
  }

  @override
  void dispose() {
    _amountController.dispose();
    _titelContreller.dispose();
    super.dispose();
  }

  DateTime? etime;

  @override
  Widget build(BuildContext context) {
    return Padding(
        // ignore: sort_child_properties_last
        child: Center(
          child: Column(
            children: [
              TextField(
                controller: _titelContreller,
                maxLength: 50,
                decoration:
                    const InputDecoration(label: Text('Hello abo mohammed')),
              ),
              const SizedBox(
                height: 12,
              ),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _amountController,
                      decoration: const InputDecoration(
                        prefixText: "\$",
                        label: Text(
                          "Amount",
                        ),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  const SizedBox(
                    width: 25,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(etime == null
                          ? 'Select date'
                          : DateFormat.yMd().format(etime!)),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          IconButton(
                              onPressed: () {
                                showDatePicker(
                                        context: this.context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime(1900),
                                        lastDate: DateTime(2100))
                                    .then(
                                  (value) => setState(
                                    () {
                                      etime = value!;
                                    },
                                  ),
                                );
                              },
                              icon: const Icon(Icons.calendar_month_outlined)),
                        ],
                      )
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Spacer(
                    flex: 1,
                  ),
                  DropdownButton(
                    value: _dropbuttonvalue,
                    items: Catagory.values.map(
                      (e) {
                        return DropdownMenuItem(
                          value: e,
                          child: Text(e.name.toUpperCase()),
                        );
                      },
                    ).toList(),
                    onChanged: (value) {
                      if (value == null) {
                        return;
                      }
                      setState(() {
                        _dropbuttonvalue = value;
                      });
                    },
                  ),
                  Spacer(
                    flex: 3,
                  ),
                  ElevatedButton(
                      onPressed: _invaild, child: const Text('save titel')),
                  const SizedBox(
                    width: 20,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('cancel')),
                  Spacer(
                    flex: 1,
                  )
                ],
              )
            ],
          ),
        ),
        padding: const EdgeInsets.fromLTRB(16, 48, 16, 0));
  }
}
