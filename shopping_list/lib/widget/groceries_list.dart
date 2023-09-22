import 'package:flutter/material.dart';
import 'package:shopping_list/widget/new_item.dart';

import '../model/grocery_item.dart';

class GroceriesList extends StatefulWidget {
  const GroceriesList({super.key});

  @override
  State<StatefulWidget> createState() {
    return _GroceriesListState();
  }
}

class _GroceriesListState extends State<GroceriesList> {
  final List<GroceryItem> _groceryItem = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Groceries'),
        actions: [
          IconButton(
              onPressed: () async {
                final newItem = await Navigator.of(context)
                    .push<GroceryItem>(MaterialPageRoute(builder: (ctx) => const NewItem()));

                if(newItem == null) {
                  return;
                }

                setState(() {
                  _groceryItem.add(newItem);
                });
              },
              icon: const Icon(Icons.add)),
        ],
      ),
      body: ListView.builder(
          itemCount: _groceryItem.length,
          itemBuilder: (ctx, index) => ListTile(
                title: Text(_groceryItem[index].name),
                leading: Container(
                  width: 24,
                  height: 24,
                  color: _groceryItem[index].category.color,
                ),
                trailing: Text(_groceryItem[index].quantity.toString()),
              )),
    );
  }
}
