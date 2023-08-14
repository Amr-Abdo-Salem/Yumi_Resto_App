import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

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
            size: 30,
          ),
        ),
        title: const Text(
          'About us',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            wordSpacing: 2,
            letterSpacing: 3,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(5),
            ),
            ListTile(
              leading: Icon(
                Icons.star_border_rounded,
                color: Colors.blue.shade900,
              ),
              title: Text(
                "Decisions you need to make",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                    "Creating an online store is as challenging as running an actual store. You need to make decisions to ensure that it will run smoothly and orders will be fulfilled on time. For starters, here are some of the fundamentals of how to make online shopping websites:"),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(5),
            ),
            ListTile(
              leading: Icon(
                Icons.star_border_rounded,
                color: Colors.blue.shade900,
              ),
              title: Text(
                "Ecommerce website design and user interface",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                    "How your online store look is the defining factor whether your customer will stay or opt out of your platform. The rule of thumb is ease of use. Remember, internet users have a very short attention span and they want everything to be done in an instant. If you can give this to them, you’re likely to enjoy high conversion rates."),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(5),
            ),
            ListTile(
              leading: Icon(
                Icons.star_border_rounded,
                color: Colors.blue.shade900,
              ),
              title: Text(
                "Payment gateways",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                    "The more payment gateways available on your store, the bigger your sales will be. Convenience translates to sales. If you have dozens of supported payment modes, your customers will think of it as a big plus. Don’t get this wrong, not all stores need tons of payment gateways. Just get the basics covered: PayPal, Stripe, Authorize.net, Venmo, WorldPay, and credit card processors."),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5),
            ),
            ListTile(
              leading: Icon(
                Icons.star_border_rounded,
                color: Colors.blue.shade900,
              ),
              title: Text(
                "Level of customization",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                    "Most newbies will resort to choosing a sleek template and settle with that. There’s nothing wrong about this as long as it serves its purpose on your store. Still, it won’t hurt to look on ecommerce website examples for added inspiration."),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5),
            ),
            ListTile(
              leading: Icon(
                Icons.star_border_rounded,
                color: Colors.blue.shade900,
              ),
              title: Text(
                "Building from scratch vs. using open-source solutions",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                    "One thing that sparked the rise of online stores is the emergence of many open-source ecommerce solutions. With this, you can access a website builder, integrations, payment gateways, and more in just one platform. However, a store owner would have to pay for monthly costs, not to mention the cost of necessary add-ons."),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
