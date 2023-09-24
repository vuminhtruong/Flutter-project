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
    Widget content = const Center(child: Text('No items added yet.'),);

    if(_groceryItem.isNotEmpty) {
      content = ListView.builder(
          itemCount: _groceryItem.length,
          itemBuilder: (ctx, index) => Dismissible(onDismissed: (direction) {
            setState(() {
              _groceryItem.remove(_groceryItem[index]);
            });
          },key: ValueKey(_groceryItem[index].id), child: ListTile(
            title: Text(_groceryItem[index].name),
            leading: Container(
              width: 24,
              height: 24,
              color: _groceryItem[index].category.color,
            ),
            trailing: Text(_groceryItem[index].quantity.toString()),
          )));
    }

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
      body: content,
    );
  }
}
