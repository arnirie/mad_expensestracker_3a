import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:mad1_expensestracker_3a/models/expenses_item.dart';

class ExpensesEntry extends StatefulWidget {
  ExpensesEntry({super.key, required this.addItem});

  Function(ExpensesItem item) addItem;

  @override
  State<ExpensesEntry> createState() => _ExpensesEntryState();
}

class _ExpensesEntryState extends State<ExpensesEntry> {
  TextEditingController descController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  DateTime? selectedDate;

  void dismissEntry() {
    // Navigator.pop(context);
    Navigator.of(context).pop();
  }

  void showSelectDate() async {
    var now = DateTime.now();
    var date = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: DateTime(now.year - 1, 1, 1),
      lastDate: DateTime(now.year, 12, 31),
    ); //.then((value) => print(value))
    print('shown picker');
    if (date == null) return;
    selectedDate = date;
    setState(() {});
  }

  void insertItem() {
    //add list
    widget.addItem(
      ExpensesItem(
          description: descController.text,
          amount: double.parse(amountController.text),
          date: selectedDate!),
    );
    dismissEntry();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            controller: descController,
            decoration: InputDecoration(
              label: Text('Description'),
            ),
          ),
          TextField(
            controller: amountController,
            decoration: InputDecoration(
              label: Text('Amount'),
              prefix: Text('₱ '),
            ),
            keyboardType: TextInputType.number,
          ),
          TextButton.icon(
            onPressed: showSelectDate,
            icon: Icon(Icons.calendar_month),
            label: Text(selectedDate == null
                ? 'Select date'
                : '${DateFormat.yMd().format(selectedDate!)}'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: dismissEntry,
                child: const Text('Cancel'),
              ),
              const Gap(8),
              ElevatedButton(
                onPressed: insertItem,
                child: const Text('ADD'),
              )
            ],
          )
        ],
      ),
    );
  }
}
