import 'package:flutter/material.dart';
import 'package:yumi_resto/models/restaurant_model.dart';
import 'package:yumi_resto/screens/basket/basket_screen.dart';
import 'package:yumi_resto/screens/checkout/checkout_screen.dart';
import 'package:yumi_resto/screens/delivery_Time/Delivery_Time_screen.dart';
import 'package:yumi_resto/screens/filter/filter_screen.dart';
import 'package:yumi_resto/screens/home/Home_Screen.dart';
import 'package:yumi_resto/screens/location/location_screen.dart';
import 'package:yumi_resto/screens/resturant_details/resturant_details_screen.dart';
import 'package:yumi_resto/screens/voucher/voucher.dart';
import '../screens/edit_basket/edit_basket_screen.dart';
import '../screens/resturant_listing/resturant_listing_screen.dart';

class AppRouter {
  static Route generateRoute(RouteSettings settings) {
    /** root screen */
    switch (settings.name) {
      case '/':
        return HomeScreen.route(settings);

      case HomeScreen.routeName:
        return HomeScreen.route(settings);

/** Another screens */
      case LocationScreen.routeName:
        return LocationScreen.route(settings);

      case BasketScreen.routeName:
        return BasketScreen.route(settings);

      case EditBasketScreen.routeName:
        return EditBasketScreen.route(settings);

      case CheckoutScreen.routeName:
        return CheckoutScreen.route(settings);

      case DeliveryTimeScreen.routeName:
        return DeliveryTimeScreen.route(settings);

      case FilterScreen.routeName:
        return FilterScreen.route(settings);

      case ResturantDetailsScreen.routeName:
        return ResturantDetailsScreen.route(
            restaurant: settings.arguments! as Restaurant);

      case ResturantListingScreen.routeName:
        return ResturantListingScreen.route(
            restaurants: settings.arguments! as List<Restaurant>);

      case VoucherScreen.routeName:
        return VoucherScreen.route(settings);
      //  break;
      // defualt: return _errorRoute();
    }
    return _errorRoute();
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text('Its an error'),
          centerTitle: true,
        ),
        body: const Center(
          child: Text('Page not found!!!'),
        ),
      ),
      settings: const RouteSettings(name: '/error'),
    );
  }
}
