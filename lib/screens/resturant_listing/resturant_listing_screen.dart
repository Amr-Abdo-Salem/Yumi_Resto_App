import 'package:flutter/material.dart';

import '../../models/restaurant_model.dart';

class ResturantListingScreen extends StatelessWidget {
  static const String routeName = '/Resturant-Listing';

  const ResturantListingScreen({super.key, required this.restaurants});

  static Route route({required List<Restaurant> restaurants}) {
    return MaterialPageRoute(
      builder: (_) => ResturantListingScreen(restaurants: restaurants),
      settings: RouteSettings(name: routeName),
    );
  }

  final List<Restaurant> restaurants;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 245, 198, 184),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            size: 22,
          ),
        ),
        title: const Text(
          'Filtering',
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
          ),
        ),
        backgroundColor: Color.fromARGB(255, 119, 82, 71),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: restaurants.length,
          itemBuilder: (context, index) {
            return ResturantCard(restaurant: restaurants[index]);
          },
        ),
      ),
    );
  }
}

class ResturantCard extends StatelessWidget {
  final Restaurant restaurant;

  const ResturantCard({super.key, required this.restaurant});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(
            context,
            '/Resturant-details',
            arguments: restaurant,
          );
        },
        child: Card(
          color: Colors.grey[500],
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Stack(children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 150,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(3),
                      topRight: Radius.circular(3),
                    ),
                    image: DecorationImage(
                        image: NetworkImage(restaurant.imageUrl),
                        fit: BoxFit.cover)),
              ),
              Positioned(
                top: 10,
                right: 10,
                child: Container(
                  width: 60,
                  height: 30,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(3),
                      topRight: Radius.circular(3),
                    ),
                  ),
                  child: Align(
                      alignment: Alignment.center,
                      child: Text("${restaurant.deliveryTime} min")),
                ),
              )
            ]),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(restaurant.name,
                      style: TextStyle(
                        fontSize: 20,
                      )),
                  SizedBox(
                    height: 5,
                  ),
                  // Text('${restaurant.tags}'),
                  Row(
                      children: restaurant.tags
                          .map((tag) => restaurant.tags.indexOf(tag) ==
                                  restaurant.tags.length - 1
                              ? Text(
                                  tag,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                )
                              : Text(
                                  '$tag ,',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ))
                          .toList()),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                      '${restaurant.distance} km - \$ ${restaurant.deliveryFee} delivery fee')
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
