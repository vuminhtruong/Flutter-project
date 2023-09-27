import 'package:favorite_place/model/place.dart';
import 'package:favorite_place/widget/places_list.dart';
import 'package:flutter/material.dart';

class PlacesScreen extends StatelessWidget {
  const PlacesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Places'),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.add))],
      ),
      body: PlacesList(
        places: [
          Place(title: 'Home'), 
          Place(title: 'Office'),
          Place(title: 'Market'),
        ],
      ),
    );
  }
}
