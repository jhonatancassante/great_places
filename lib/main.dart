import 'package:flutter/material.dart';
import 'package:great_places/providers/great_places.dart';
import 'package:great_places/screens/place_form_screen.dart';
import 'package:great_places/screens/places_list_screen.dart';
import 'package:great_places/utils/app_routes.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = {
      'seed': Colors.indigo,
      'primary': Colors.indigoAccent[400],
      'secondary': Colors.amberAccent[400],
      'text': Colors.white,
    };
    final ThemeData theme = ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: colors['seed']!,
        primary: colors['primary']!,
        secondary: colors['secondary']!,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: colors['primary']!,
        foregroundColor: colors['text']!,
      ),
      textTheme: TextTheme(
        titleLarge: TextStyle(
          color: colors['text']!,
        ),
      ),
      buttonTheme: ButtonThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: colors['seed']!,
          surface: colors['text']!,
        ),
      ),
      useMaterial3: true,
    );
    return ChangeNotifierProvider(
      create: (ctx) => GreatPlaces(),
      child: MaterialApp(
        title: 'Great Places',
        theme: theme,
        debugShowCheckedModeBanner: false,
        home: const PlacesListScreen(),
        routes: {
          AppRoutes.placeForm: (ctx) => const PlaceFormScreen(),
        },
      ),
    );
  }
}
