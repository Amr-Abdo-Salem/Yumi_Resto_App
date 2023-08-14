import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumi_resto/blocs/basket/basket_bloc.dart';
import 'package:yumi_resto/blocs/filter/filter_bloc.dart';
import 'package:yumi_resto/blocs/geolocation/geolocation_bloc.dart';
import 'package:yumi_resto/repositories/geolocation/geolocation_repositories.dart';
import 'package:yumi_resto/repositories/places/places_repository.dart';
import 'package:yumi_resto/screens/Login/sign_in.dart';
import 'blocs/autocomplete/autocomplete_bloc.dart';
import 'config/theme.dart';
import 'screens/home/export_screens.dart';

late bool isLogn;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  var user = FirebaseAuth.instance.currentUser;
  if (user == null) {
    isLogn = false;
  } else {
    isLogn = true;
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
        providers: [
          RepositoryProvider<GeolocationRepository>(
            create: (_) => GeolocationRepository(),
          ),
          RepositoryProvider<PlacesRepository>(
            create: (_) => PlacesRepository(),
          ),
        ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
                create: (context) => GeolocationBloc(
                    geolocationRepository:
                        context.read<GeolocationRepository>())
                  ..add(LoadGeolocation())),
            BlocProvider(
              create: (context) => AutocompleteBloc(
                placesRepository: context.read<PlacesRepository>(),
              )..add(LoadAutocomplete()),
            ),
            BlocProvider(
              create: (context) => FilterBloc()..add(LoadFilter()),
            ),
            BlocProvider(
              create: (context) => BasketBloc()..add(StartBasket()),
            ),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Yumi Resto',
            theme: theme(),
            home: isLogn == false ? SignInScreen() : HomeScreen(),
            onGenerateRoute: AppRouter.generateRoute,
          ),
        ));
  }
}
