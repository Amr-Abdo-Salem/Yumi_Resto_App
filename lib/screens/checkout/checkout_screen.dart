import 'package:flutter/material.dart';
import 'package:yumi_resto/screens/donation/donation.dart';
import 'package:yumi_resto/screens/send_order/send_order.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

  static const String routeName = '/Checkout';

  static Route route(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (_) => const CheckoutScreen(),
      settings: const RouteSettings(name: routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 245, 198, 184),
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            size: 30,
          ),
        ),
        title: const Text(
          'Checkout',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            letterSpacing: 3,
          ),
        ),
        backgroundColor: Color.fromARGB(255, 119, 82, 71),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(
              image: AssetImage("assets/checkout-icon-16.jpg"),
              color: Colors.black,
            ),
            SizedBox(
              height: 70,
            ),
            // Image.asset("assets/checkout-icon-16.jpg"),
            SendOrderScreen(),
            SizedBox(
              height: 90,
            ),
            Column(
              children: [
                Text(
                  ' If You Want To Donate For Poor Pepole :',
                  style: TextStyle(
                    fontSize: 25,
                    // fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Text(
                  ' Click Here ',
                  style: TextStyle(
                    fontSize: 25,
                    // fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Card(
                  elevation: 20,
                  child: MaterialButton(
                    child: Image.asset(
                      'assets/donation.png',
                      width: 100,
                      height: 100,
                    ),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => DonationScreen(),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
