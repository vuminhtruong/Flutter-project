import 'package:flutter/material.dart';
import 'package:flutter_expense_tracker_app/widget/expenses_list/expense_item.dart';

import '../../model/expense.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList(
      {super.key, required this.expenses, required this.onRemoveExpense});

  final List<Expense> expenses;
  final void Function(Expense expense) onRemoveExpense;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (ctx, index) =>
          Dismissible(
              key: ValueKey(expenses[index]),
              background: Container(
                color: Theme.of(context).colorScheme.error.withOpacity(0.8),
                margin: const EdgeInsets.symmetric(
                  horizontal: 10
                ),
              ),
              onDismissed: (direction) {
                onRemoveExpense(expenses[index]);
              },
              child: ExpenseItem(
                expense: expenses[index]
              ),
          ),
      shrinkWrap: true,
    );
  }
}
