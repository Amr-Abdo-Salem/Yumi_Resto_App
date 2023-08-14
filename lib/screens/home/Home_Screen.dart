import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:yumi_resto/models/models.dart';
import 'package:yumi_resto/screens/profile/profile_screen.dart';
import '../../models/promo_model.dart';
import '../../widgets/category_box.dart';
// import '../../widgets/food_search_box.dart';
import '../../widgets/promo_box.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const String routeName = '/';

  static Route route(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (_) => const HomeScreen(),
      settings: const RouteSettings(name: routeName),
    );
  }

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

var token = FirebaseMessaging.instance.getToken();

class _HomeScreenState extends State<HomeScreen> {
  initialMessage() async {
    var message = await FirebaseMessaging.instance.getInitialMessage();
    if (message != null) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => HomeScreen(),
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    initialMessage();
    print(token);
    FirebaseMessaging.onMessage.listen((event) {
      print('On Message');
      print(event.data.toString());
      Fluttertoast.showToast(
        msg: "Found New Order",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 1,
        backgroundColor: Color.fromARGB(255, 13, 71, 161),
        textColor: Colors.white,
        fontSize: 22.0,
      );
    });
    FirebaseMessaging.onMessageOpenedApp.listen((event) {
      print('On Message Opened App');
      print(event.data.toString());
      Fluttertoast.showToast(
        msg: 'New Offer',
        gravity: ToastGravity.BOTTOM,
        toastLength: Toast.LENGTH_LONG,
        fontSize: 25,
        backgroundColor: Color.fromARGB(255, 13, 71, 161),
        textColor: Colors.black,
        timeInSecForIosWeb: 2,
      );
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => HomeScreen(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 245, 198, 184),
        appBar: AppBar(
          centerTitle: true,
          toolbarHeight: 60,
          backgroundColor: Color.fromARGB(255, 119, 82, 71),
          title: Text(
            'Restaurants',
            style: TextStyle(
              fontSize: 30,
              letterSpacing: 3,
            ),
          ),
          leading: IconButton(
            icon: Icon(
              Icons.menu,
              size: 30,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ProfileScreen(),
                ),
              );
            },
          ),
        ),
        body: Column(children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(8),
              child: SizedBox(
                height: 100,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: Category.categories.length,
                    itemBuilder: (context, index) {
                      return CategoryBox(category: Category.categories[index]);
                    }),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(8),
              child: SizedBox(
                height: 125,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: Promo.promos.length,
                    itemBuilder: (context, index) {
                      return PromoBox(promo: Promo.promos[index]);
                    }),
              ),
            ),
          ),
          // food_search_box(),
          Padding(
            padding: EdgeInsets.all(8),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                " TOP RATED RESTURANTS ",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              height: 550,
              child: ListView.builder(
                  itemCount: Restaurant.restaurants.length,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return ResturantCard(
                        restaurant: Restaurant.restaurants[index]);
                  }),
            ),
          )
        ]));
  }
}

class ResturantCard extends StatelessWidget {
  final Restaurant restaurant;

  const ResturantCard({super.key, required this.restaurant});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(
            context,
            '/Resturant-details',
            arguments: restaurant,
          );
        },
        child: Card(
          color: Colors.grey[500],
          elevation: 10,
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
                    fit: BoxFit.fill,
                  ),
                ),
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
                    child: Text("${restaurant.deliveryTime} min"),
                  ),
                ),
              )
            ]),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    restaurant.name,
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  // SizedBox(
                  //   height: 5,
                  // ),
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
                  Text('  ${restaurant.deliveryFee} delivery fee')
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
