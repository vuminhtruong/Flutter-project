import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddPlaceScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AddPlaceScreenState();
  }
}

class _AddPlaceScreenState extends State<AddPlaceScreen> {
  final _titleController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add new Place'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(labelText: 'Title'),
              controller: _titleController,
              style: TextStyle(
                color: Theme.of(context).colorScheme.onBackground,
              ),
            ),
            const SizedBox(height: 16,),
            ElevatedButton.icon(onPressed: () {}, icon: const Icon(Icons.add),label: const Text('Add Place'),),
          ],
        ),
      ),
    );
  }

}

