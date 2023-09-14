import 'package:flutter/material.dart';
import 'package:flutter_expense_tracker_app/model/expense.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem({super.key, required this.expense});

  final Expense expense;

  @override
  Widget build(context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 16
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(expense.title,style: Theme.of(context).textTheme.titleLarge,),
                const SizedBox(height: 4,),
                Row (
                  children: [
                    Text('\$${expense.amount.toStringAsFixed(2)}'),
                    const Spacer(),
                    Row(
                      children: [
                        Icon(categoryIcons[expense.category]),
                        const SizedBox(width: 8,),
                        Text(expense.formattedDate),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        )
    );
  }
}
