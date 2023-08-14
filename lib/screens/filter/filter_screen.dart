import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumi_resto/models/models.dart';
import 'package:yumi_resto/screens/filter/widgets/widgets.dart';
import '../../blocs/filter/filter_bloc.dart';

class FilterScreen extends StatelessWidget {
  const FilterScreen({Key? key}) : super(key: key);

  static const String routeName = '/filter';

  static Route route(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (_) => const FilterScreen(),
      settings: const RouteSettings(name: routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 245, 198, 184),
      appBar: AppBar(
        title: const Text(
          'Filter',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            letterSpacing: 3,
          ),
        ),
        elevation: 10,
        backgroundColor: Color.fromARGB(255, 119, 82, 71),
      ),
      bottomNavigationBar: BottomAppBar(
          child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<FilterBloc, FilterState>(builder: (context, state) {
              if (state is FilterLoading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is FilterLoaded) {
                return ElevatedButton(
                  onPressed: () {
                    var categories = state.filter.categoryFilters
                        .where((filter) => filter.value)
                        .map((filter) => filter.category.name)
                        .toList();

                    var prices = state.filter.priceFilters
                        .where((filter) => filter.value)
                        .map((filter) => filter.price.price)
                        .toList();

                    List<Restaurant> restaurants = Restaurant.restaurants
                        .where((restaurant) => categories.any(
                            (category) => restaurant.tags.contains(category)))
                        .where((restaurant) => prices.any((price) =>
                            restaurant.priceCategory.contains(price)))
                        .toList();

                    Navigator.pushNamed(
                      context,
                      '/Resturant-Listing',
                      arguments: restaurants,
                    );
                  },
                  child: Text("Apply"),
                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 50),
                      shape: RoundedRectangleBorder()),
                );
              } else {
                return Text('Something went wrong.');
              }
            })
          ],
        ),
      )),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Price',
              style: Theme.of(context).textTheme.headline4!.copyWith(
                    color: Colors.blue,
                  ),
            ),
            CustomPriceFilter(),
            Text(
              'Category',
              style: Theme.of(context).textTheme.headline4!.copyWith(
                    color: Colors.blue,
                  ),
            ),
            CustomCategoryFilter(),
          ],
        ),
      ),
    );
  }
}
