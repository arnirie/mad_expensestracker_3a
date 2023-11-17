import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:mad1_expensestracker_3a/models/expenses_item.dart';

class ExpensesListView extends StatelessWidget {
  ExpensesListView(
      {super.key, required this.expensesList, required this.removeItem});

  List<ExpensesItem> expensesList;
  Function(ExpensesItem item) removeItem;

  @override
  Widget build(BuildContext context) {
    var date_formatter = DateFormat.yMd();
    var amount_formatter = NumberFormat.currency(
      symbol: '₱ ',
      decimalDigits: 2,
    );
    return ListView.builder(
      itemCount: expensesList.length,
      itemBuilder: (_, index) => Dismissible(
        key: ValueKey(expensesList[index].id),
        direction: DismissDirection.endToStart,
        background: Container(
          alignment: Alignment.centerRight,
          padding: const EdgeInsets.only(right: 12),
          color: Colors.red,
          child: Icon(
            Icons.delete,
            color: Colors.white,
          ),
        ),
        // secondaryBackground: Container(
        //   color: Colors.red,
        // ),
        onDismissed: (direction) => removeItem(expensesList[index]),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${expensesList[index].description}',
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                const Gap(20),
                Row(
                  children: [
                    Text(
                        '${amount_formatter.format(expensesList[index].amount)}'),
                    const Spacer(),
                    Text('${date_formatter.format(expensesList[index].date)}'),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
