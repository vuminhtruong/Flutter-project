import 'dart:io';

import 'package:favorite_place/model/place.dart';
import 'package:favorite_place/model/place_location.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserPlaceNotifier extends StateNotifier<List<Place>> {
  UserPlaceNotifier() : super(const []); // const List<Place> state = [];

  void addPlace(String title,File image,PlaceLocation location) {
    state = [ Place(title: title,image: image,location: location), ...state ];
  }
}

final userPlacesProvider = StateNotifierProvider<UserPlaceNotifier,List<Place>>((ref) => UserPlaceNotifier());
