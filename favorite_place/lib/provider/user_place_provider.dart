import 'dart:io';

import 'package:favorite_place/model/place.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserPlaceNotifier extends StateNotifier<List<Place>> {
  UserPlaceNotifier() : super(const []); // const List<Place> state = [];

  void addPlace(String title,File image) {
    state = [ Place(title: title,image: image), ...state ];
  }
}

final userPlacesProvider = StateNotifierProvider<UserPlaceNotifier,List<Place>>((ref) => UserPlaceNotifier());
