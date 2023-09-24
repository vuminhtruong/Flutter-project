import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shopping_list/data/categories.dart';
import 'package:shopping_list/widget/new_item.dart';
import 'package:http/http.dart' as http;
import '../model/grocery_item.dart';

class GroceriesList extends StatefulWidget {
  const GroceriesList({super.key});

  @override
  State<StatefulWidget> createState() {
    return _GroceriesListState();
  }
}

class _GroceriesListState extends State<GroceriesList> {
  List<GroceryItem> _groceryItem = [];

  @override
  void initState() {
    super.initState();
    _loadItems();
  }

  void _loadItems() async {
    final url = Uri.https('flutter-shopping-list-db1ca-default-rtdb.firebaseio.com','shopping-list.json');
    final response = await http.get(url);
    final Map<String,dynamic> listData = json.decode(response.body);
    final List<GroceryItem> _loadedItems = [];

    for(final item in listData.entries) {
      final category = categories.entries.firstWhere((element) => element.value.title ==  item.value['category']).value;
      _loadedItems.add(
        GroceryItem(id: item.key, name: item.value['name'], quantity: item.value['quantity'], category: category)
      );
    }
    setState(() {
      _groceryItem = _loadedItems;
    });
  }

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
                await Navigator.of(context)
                    .push<GroceryItem>(MaterialPageRoute(builder: (ctx) => const NewItem()));
                _loadItems();
                },
              icon: const Icon(Icons.add)),
        ],
      ),
      body: content,
    );
  }
}
