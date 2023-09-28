import 'dart:io';

import 'package:favorite_place/model/place_location.dart';
import 'package:favorite_place/provider/user_place_provider.dart';
import 'package:favorite_place/widget/image_input.dart';
import 'package:favorite_place/widget/location_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddPlaceScreen extends ConsumerStatefulWidget {
  const AddPlaceScreen({super.key});

  @override
  ConsumerState<AddPlaceScreen> createState() {
    return _AddPlaceScreenState();
  }
}

class _AddPlaceScreenState extends ConsumerState<AddPlaceScreen> {
  final _titleController = TextEditingController();
  File? _selectedImage;
  PlaceLocation? _location;

  void _savePlace() {
    final enteredText = _titleController.text;

    if (enteredText.isEmpty) {
      return;
    }
    ref.read(userPlacesProvider.notifier).addPlace(enteredText,_selectedImage!,_location!);
    Navigator.of(context).pop();
  }

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
            ImageInput(onPickImage: (image) {
              _selectedImage = image;
            },),
            const SizedBox(height: 16,),
            LocationInput(onPickLocation: (pickedLocation) {
              _location = pickedLocation;
            },),
            const SizedBox(height: 16,),
            ElevatedButton.icon(
              onPressed: _savePlace,
              icon: const Icon(Icons.add),
              label: const Text('Add Place'),
            ),
          ],
        ),
      ),
    );
  }
}
