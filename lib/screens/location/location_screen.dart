import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumi_resto/screens/home/export_screens.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../../blocs/autocomplete/autocomplete_bloc.dart';
// import '../../blocs/geolocation/geolocation_bloc.dart';
import '../../blocs/geolocation/geolocation_bloc.dart';
import '../../widgets/widgets.dart';

// ignore: must_be_immutable
class LocationScreen extends StatelessWidget {
  LocationScreen({
    Key? key,
  }) : super(key: key);
  double latitude = 30.5280359;
  double longitude = 31.0461196;
  static const String routeName = '/location';
  static Route route(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (_) => LocationScreen(),
      settings: const RouteSettings(name: routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 245, 198, 184),
        appBar: AppBar(
          title: const Text(
            'Location',
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
              letterSpacing: 3,
              wordSpacing: 2,
            ),
          ),
          backgroundColor: Color.fromARGB(255, 119, 82, 71),
        ),
        body: Stack(
          children: [
            Container(
                height: MediaQuery.of(context).size.height,
                width: double.infinity,
                child: BlocBuilder<GeolocationBloc, GeolocationState>(
                    builder: (context, state) {
                  if (state is GeolocationLoading) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is GeolocationLoaded) {
                    return Google_Map(lat: latitude, lng: longitude);
                  } else {
                    return const Text('some thing is wrong');
                  }
                })),
            Positioned(
              child: Column(
                children: [
                  LocationSearchBox(),
                  // if (state is AutocompleteLoading) {
                  //   return Center(
                  //     child: CircularProgressIndicator(),
                  //   );
                  // } else if (state is AutocompleteLoaded) {
                  //   return Container(
                  //     margin: EdgeInsets.all(7),
                  //     width: 7,
                  //     height: 7,
                  //     child: ListView.builder(
                  //         itemCount: state.autocomplete.length,
                  //         itemBuilder: (context, index) {
                  //           return Text(
                  //               state.autocomplete[index].description);
                  //         }),
                  //   );
                  // } else {
                  //   return Text("Somthing went wrong !");
                  // }
                ],
              ),
              left: 20,
              right: 20,
              top: 30,
            ),
            Positioned(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 100),
                child: Container(
                  color: Colors.grey[500],
                  child: TextButton(
                    child: Text(
                      'SAVE',
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    ),
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => HomeScreen(),
                        ),
                      );
                    },
                  ),
                ),
              ),
              left: 20,
              right: 20,
              bottom: 50,
            )
          ],
        ));
  }
}
