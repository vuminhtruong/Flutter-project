import 'package:flutter/material.dart';

import '../model/place.dart';

class PlaceDetailScreen extends StatelessWidget {
  const PlaceDetailScreen({super.key, required this.place});

  final Place place;

  String get locationImage {
    final lat = place.location.latitude;
    final long = place.location.longitude;
    return 'https://maps.googleapis.com/maps/api/staticmap?center=$lat,$long=&zoom=15&size=600x300&maptype=roadmap&markers=color:red%7Clabel:A%7C$lat,$long&key=AIzaSyA_eav17zJTNjJjuNMN7y8ErooxGqmIE74';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(place.title),
        ),
        body: Stack(
          children: [
            Image.file(
              place.image,
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  CircleAvatar(radius: 50,backgroundImage: NetworkImage(locationImage),),
                  Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 16,
                    ),
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(colors: [
                        Colors.transparent,
                        Colors.white,
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      ),
                    ),
                    child: Text(
                      place.location.address,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground),),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
