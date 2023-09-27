import 'package:favorite_place/model/place.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserPlaceNotifier extends StateNotifier<List<Place>> {
  UserPlaceNotifier() : super(const []); // const List<Place> state = [];

  void addPlace(String title) {
    state = [ Place(title: title), ...state ];
  }
}

final userPlacesProvider = StateNotifierProvider((ref) => UserPlaceNotifier());
