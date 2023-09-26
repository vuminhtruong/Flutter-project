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
  bool _isLoading = true;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _loadItems();
  }

  void _loadItems() async {
    final url = Uri.https(
        'flutter-shopping-list-db1ca-default-rtdb.firebaseio.com',
        'shopping-list.json');
    final response = await http.get(url);
    if(response.statusCode > 400) {
      setState(() {
        _errorMessage = 'Failed to fetch data.Please try again later';
      });
    }

    if(response.body == 'null') {
      setState(() {
        _isLoading = false;
      });
      return;
    }

    final Map<String, dynamic> listData = json.decode(response.body);
    final List<GroceryItem> loadedItems = [];

    for (final item in listData.entries) {
      final category = categories.entries
          .firstWhere(
              (element) => element.value.title == item.value['category'])
          .value;
      loadedItems.add(GroceryItem(
          id: item.key,
          name: item.value['name'],
          quantity: item.value['quantity'],
          category: category));
    }
    setState(() {
      _groceryItem = loadedItems;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget content = const Center(
      child: Text('No items added yet.'),
    );

    if(_isLoading){
      content = const Center(child: CircularProgressIndicator(),);
    }

    if (_groceryItem.isNotEmpty) {
      content = ListView.builder(
          itemCount: _groceryItem.length,
          itemBuilder: (ctx, index) => Dismissible(
              onDismissed: (direction) async {
                setState(() {
                  _groceryItem.remove(_groceryItem[index]);
                });

                final url = Uri.https('flutter-shopping-list-db1ca-default-rtdb.firebaseio.com',
                    'shopping-list/${_groceryItem[index].id}.json');
                final response = await http.delete(url);
                if(response.statusCode >= 400) {
                  setState(() {
                    _groceryItem.insert(index, _groceryItem[index]);
                  });
                }
              },
              key: ValueKey(_groceryItem[index].id),
              child: ListTile(
                title: Text(_groceryItem[index].name),
                leading: Container(
                  width: 24,
                  height: 24,
                  color: _groceryItem[index].category.color,
                ),
                trailing: Text(_groceryItem[index].quantity.toString()),
              )));
    }

    if(_errorMessage != null) {
      content = Center(child: Text(_errorMessage!),);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Groceries'),
        actions: [
          IconButton(
              onPressed: () async {
                final newItem = await Navigator.of(context).push<GroceryItem>(
                    MaterialPageRoute(builder: (ctx) => const NewItem()));
                if (newItem == null) {
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