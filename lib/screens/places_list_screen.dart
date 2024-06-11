import 'package:flutter/material.dart';
import 'package:great_places/providers/great_places.dart';
import 'package:great_places/utils/app_routes.dart';
import 'package:provider/provider.dart';

class PlacesListScreen extends StatelessWidget {
  const PlacesListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meus Lugares'),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(AppRoutes.placeForm);
            },
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: Center(
        child: Consumer<GreatPlaces>(
          child: const Center(
            child: Text('Nenhum local cadastado.'),
          ),
          builder: (context, greatPlaces, child) => greatPlaces.itemsCount == 0
              ? child!
              : ListView.builder(
                  itemCount: greatPlaces.itemsCount,
                  itemBuilder: (ctx, i) => ListTile(
                    leading: CircleAvatar(
                      backgroundImage: FileImage(
                        greatPlaces.itemByIndex(i).image,
                      ),
                    ),
                    title: Text(
                      greatPlaces.itemByIndex(i).title,
                    ),
                    onTap: () {},
                  ),
                ),
        ),
      ),
    );
  }
}
