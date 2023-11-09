import 'package:flutter/material.dart';
import 'package:mad1_expensestracker_3a/components/expenses_entry.dart';
import 'package:mad1_expensestracker_3a/components/expenses_list_view.dart';
import 'package:mad1_expensestracker_3a/models/expenses_item.dart';

class ExpensesListScreen extends StatefulWidget {
  ExpensesListScreen({super.key});

  @override
  State<ExpensesListScreen> createState() => _ExpensesListScreenState();
}

class _ExpensesListScreenState extends State<ExpensesListScreen> {
  List<ExpensesItem> _expensesList = [
    ExpensesItem(
      description: 'rental',
      amount: 5000,
      date: DateTime.now(),
    ),
    ExpensesItem(
      description: 'electricity',
      amount: 2000,
      date: DateTime.now(),
    ),
  ];

  void showExpensesEntry() {
    showModalBottomSheet(
      context: context,
      builder: (_) => ExpensesEntry(
        addItem: addExpensesItem,
      ),
    );
  }

  void addExpensesItem(ExpensesItem item) {
    _expensesList.add(item);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.blu,
        title: const Text('My Expenses'),
        actions: [
          IconButton(
            onPressed: showExpensesEntry,
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ExpensesListView(
              expensesList: _expensesList,
            ),
          ),
        ],
      ),
    );
  }
}
