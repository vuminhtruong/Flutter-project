import 'package:flutter/material.dart';
import 'package:flutter_expense_tracker_app/widget/chart/chart.dart';
import 'package:flutter_expense_tracker_app/widget/expenses_list/expenses_list.dart';
import 'package:flutter_expense_tracker_app/widget/new_expense.dart';

import '../model/expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
        title: 'Flutter Course',
        amount: 19.99,
        date: DateTime.now(),
        category: Category.travel),
    Expense(
        title: 'Cinema',
        amount: 15.99,
        date: DateTime.now(),
        category: Category.work)
  ];

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
        useSafeArea: true,
        isScrollControlled: true,
        context: context,
        builder: (ctx) => NewExpense(
              onAddExpense: _addExpense,
            ));
  }

  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    final expenseIndex = _registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: const Duration(seconds: 3),
      content: const Text('Expense deleted.'),
      action: SnackBarAction(
        label: 'Undo',
        onPressed: () {
          setState(() {
            _registeredExpenses.insert(expenseIndex, expense);
          });
        },
      ),
    ));
  }

  @override
  Widget build(context) {
    final width = MediaQuery.of(context).size.width;

    Widget mainContent = const Center(
      child: Text('No expense found. Start adding some!'),
    );

    if (_registeredExpenses.isNotEmpty) {
      mainContent = ExpensesList(
          onRemoveExpense: _removeExpense, expenses: _registeredExpenses);
    }

    return SafeArea(
        minimum: const EdgeInsets.symmetric(vertical: 8),
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Flutter ExpenseTracker'),
            actions: [
              IconButton(
                  onPressed: _openAddExpenseOverlay,
                  icon: const Icon(Icons.add))
            ],
          ),
          body: width < 600
              ? Column(
                  children: [
                    Chart(expenses: _registeredExpenses),
                    Expanded(child: mainContent),
                  ],
                )
              : Row(
                  children: [
                    Expanded(child: Chart(expenses: _registeredExpenses)),
                    Expanded(child: mainContent),
                  ],
                ),
        ));
  }
}
