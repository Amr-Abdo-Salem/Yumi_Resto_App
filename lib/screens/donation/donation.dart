import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_paypal_checkout/flutter_paypal_checkout.dart';

class DonationScreen extends StatefulWidget {
  const DonationScreen({super.key});

  @override
  State<DonationScreen> createState() => _DonationScreenState();
}

class _DonationScreenState extends State<DonationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 245, 198, 184),
      appBar: AppBar(
        // leadingWidth: 2,
        backgroundColor: Color.fromARGB(255, 119, 82, 71),
        title: const Text(
          'Donation',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            letterSpacing: 3,
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
            size: 30,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        toolbarHeight: 60,
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 16.0,
            left: 8.0,
            right: 8.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // SizedBox(
              //   height: 100,
              // ),
              const Text(
                'HI SIR !',
                style: TextStyle(
                  fontSize: 60,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Card(
                  elevation: 5,
                  child: Image(
                    image: AssetImage('assets/poors.jpg'),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                'Welcome to the donation stage .',
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
              const Text(
                'And this donation goes to restaurants to take out meals from restaurants for the poor and needy .',
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
              const SizedBox(
                height: 100,
              ),

              // Spacer(
              //   flex: 1,
              // ),
              // TextButton(
              //
              //   style: TextButton.styleFrom(
              //     backgroundColor: Colors.teal,
              //     foregroundColor: Colors.white,
              //     shape: const BeveledRectangleBorder(
              //       borderRadius: BorderRadius.all(
              //         Radius.circular(1),
              //       ),
              //     ),
              //   ),
              //   child: const Text('Checkout'),
              // ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
          child: Container(
        color: Colors.grey[500],
        height: 90,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              elevation: 5,
              child: MaterialButton(
                onPressed: () async {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => PaypalCheckout(
                      sandboxMode: true,
                      clientId:
                          "AXT6K0SQyAXgp1va1vXTxB00VSmfuOZqYyaZEUUl3hh8kDfhsms64Wxf4-M_0U2WAhtVLsjpfJ7LN9VG",
                      secretKey:
                          "ELr77AQYZbTVONrUsXGLoYjivNV6fXHR3sn5-DGTQkp-026zxFMIVGRZgIK2GWHvGPU8enmvh3VQYZtW",
                      returnURL: "success.snippetcoder.com",
                      cancelURL: "cancel.snippetcoder.com",
                      transactions: const [
                        {
                          "amount": {
                            "total": '70',
                            "currency": "USD",
                            "details": {
                              "subtotal": '70',
                              "shipping": '0',
                              "shipping_discount": 0
                            }
                          },
                          "description": "The payment transaction description.",
                          // "payment_options": {
                          //   "allowed_payment_method":
                          //       "INSTANT_FUNDING_SOURCE"
                          // },
                          "item_list": {
                            "items": [
                              {
                                "name": "Apple",
                                "quantity": 4,
                                "price": '5',
                                "currency": "USD"
                              },
                              {
                                "name": "Pineapple",
                                "quantity": 5,
                                "price": '10',
                                "currency": "USD"
                              }
                            ],

                            // shipping address is not required though
                            //   "shipping_address": {
                            //     "recipient_name": "Raman Singh",
                            //     "line1": "Delhi",
                            //     "line2": "",
                            //     "city": "Delhi",
                            //     "country_code": "IN",
                            //     "postal_code": "11001",
                            //     "phone": "+00000000",
                            //     "state": "Texas"
                            //  },
                          }
                        }
                      ],
                      note: "Contact us for any questions on your order.",
                      onSuccess: (Map params) async {
                        print("onSuccess: $params");
                        AwesomeDialog(
                          context: context,
                          title: "ERROR",
                          body: const Text("The Donation Is Success"),
                        ).show();
                      },
                      onError: (error) {
                        print("onError: $error");
                        AwesomeDialog(
                          context: context,
                          title: "ERROR",
                          body: const Text("ERROR"),
                        ).show();
                        Navigator.pop(context);
                      },
                      onCancel: () {
                        print('cancelled:');
                        AwesomeDialog(
                          context: context,
                          title: "ERROR",
                          body: const Text("Your operation is canceled"),
                        ).show();
                      },
                    ),
                  ));
                },
                child: Image.asset(
                  'assets/donation.png',
                  height: 70,
                  width: 150,
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
