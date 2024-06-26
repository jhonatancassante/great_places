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
      body: FutureBuilder(
        future: Provider.of<GreatPlaces>(
          context,
          listen: false,
        ).loadPlaces(),
        builder: (ctx, snapshot) =>
            snapshot.connectionState == ConnectionState.waiting
                ? const Center(child: CircularProgressIndicator())
                : Consumer<GreatPlaces>(
                    child: const Center(
                      child: Text('Nenhum local cadastado.'),
                    ),
                    builder: (context, greatPlaces, child) =>
                        greatPlaces.itemsCount == 0
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
                                  subtitle: Text(
                                    greatPlaces.itemByIndex(i).location.address,
                                  ),
                                  onTap: () {
                                    Navigator.of(context).pushNamed(
                                      AppRoutes.placeDetails,
                                      arguments: greatPlaces.itemByIndex(i),
                                    );
                                  },
                                ),
                              ),
                  ),
      ),
    );
  }
}
