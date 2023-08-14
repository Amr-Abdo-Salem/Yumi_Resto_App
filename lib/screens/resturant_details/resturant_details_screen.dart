import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/restaurant_model.dart';
import '../../widgets/restaurant_information.dart';
import 'package:yumi_resto/blocs/basket/basket_bloc.dart';

class ResturantDetailsScreen extends StatelessWidget {
  final Restaurant restaurant;
  const ResturantDetailsScreen({required this.restaurant});

  static const String routeName = '/Resturant-details';

  static Route route({required Restaurant restaurant}) {
    return MaterialPageRoute(
      builder: (_) => ResturantDetailsScreen(restaurant: restaurant),
      settings: RouteSettings(name: routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 245, 198, 184),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 119, 82, 71),
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_new,
              size: 22,
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
            child: Container(
          height: 60,
          color: Colors.grey[500],
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                elevation: 5,
                color: Color.fromARGB(255, 245, 192, 177),
                child: Container(
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    // border: Border.all(
                    //   color: Colors.grey,
                    //   width: 2,
                    // ),
                  ),
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/basket');
                    },
                    child: Text(
                      "Basket",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        )),
        extendBodyBehindAppBar: true,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(
                      bottom: Radius.elliptical(
                          MediaQuery.of(context).size.width, 50)),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(restaurant.imageUrl),
                  ),
                ),
              ),
              RestaurantInformation(restaurant: restaurant),
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                itemCount: restaurant.tags.length,
                itemBuilder: (context, index) {
                  return _buildProducts(restaurant, context, index);
                },
              ),
            ],
          ),
        ));
  }

  Widget _buildProducts(
      Restaurant restaurant, BuildContext context, int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Text(
            restaurant.tags[index],
            style: TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Column(
          children: restaurant.menuItems
              .where((menuItem) => menuItem.category == restaurant.tags[index])
              .map(
                (menuItem) => Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: ListTile(
                        dense: true,
                        contentPadding: EdgeInsets.zero,
                        leading: Container(
                          width: 80,
                          height: 80,
                          child: Image.network(
                            menuItem.foodImage,
                            fit: BoxFit.cover,
                          ),
                        ),
                        title: Text(
                          menuItem.name,
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 3,
                        ),
                        subtitle: Text(menuItem.description),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "\$ ${menuItem.price}",
                              style: TextStyle(
                                  fontSize: 13, fontWeight: FontWeight.bold),
                            ),
                            BlocBuilder<BasketBloc, BasketState>(
                                builder: (context, state) {
                              return IconButton(
                                  onPressed: () {
                                    context.read<BasketBloc>()
                                      ..add(AddItem(menuItem));
                                  },
                                  icon: Icon(
                                    Icons.add_circle,
                                    color: Colors.blueGrey,
                                  ));
                            })
                          ],
                        ),
                      ),
                    ),
                    Divider(
                      height: 2,
                    )
                  ],
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}
