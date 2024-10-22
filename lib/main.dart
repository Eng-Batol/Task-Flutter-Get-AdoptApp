// import 'package:adopt_app/pages/.dart';
import 'package:adopt_app/pages/update_page.dart'; // UpdatePage is properly imported
import 'package:adopt_app/pages/home_page.dart';
// import 'package:adopt_app/pages/updatePage.dart';
import 'package:adopt_app/providers/pets_provider.dart';
import 'package:adopt_app/widgets/add_form.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:adopt_app/pages/add_page.dart'; // Correctly pointing to the file in the 'pages' folder

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => PetsProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser:
          _router.routeInformationParser, // Updated to include this
      routerDelegate: _router.routerDelegate, // Updated to include this
    );
  }

  final _router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: '/add_page',
        builder: (context, state) => AddPage(),
      ),
      GoRoute(
        path: '/add_form',
        builder: (context, state) => AddForm(),
      ),
      GoRoute(
        path: '/add_form',
        builder: (context, state) => UpdatePage(
          pet: pet,
        ),
      ),
      GoRoute(
        path: '/update/:petId', // Route for updating the pet with dynamic petId
        builder: (context, state) {
          final pet = Provider.of<PetsProvider>(context).pets.firstWhere(
              (pet) =>
                  pet.id.toString() ==
                  state.pathParameters['petId']!); // Find the pet by ID
          return UpdatePage(pet: pet);
        },
      ),
    ],
  );

  static var pet;
}
