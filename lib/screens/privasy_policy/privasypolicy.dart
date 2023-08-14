import 'package:flutter/material.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 245, 198, 184),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 119, 82, 71),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            size: 22,
          ),
        ),
        elevation: 0,
        // brightness: Brightness.light,

        title: const Text(
          'Privacy Policy',
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            letterSpacing: 3,
            wordSpacing: 2,
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
                "Generate Privacy Policy for websites",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                    "Creating a Privacy Policy for your application or website can take a lot of time. You could either spend tons of money on hiring a lawyer, or you could simply use our service and get a unique Privacy Policy fully customized to your website."),
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
                "Generate Privacy Policy for e-commerce stores",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                    "If your website or app has the option to receive payments then including a Privacy Policy is required by law. We will make sure that your Privacy Policy ensures that you stay in line with your legal obligations."),
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
                "Generate Privacy Policy for mobile & desktop apps",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                    "For any app you are developing you will need a Privacy Policy to launch it. Termify can help you generate the best for the case and get your app ready for review."),
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
                "Generate Privacy Policy for Facebook pages & apps",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                    "Many platforms like facebook are requiring users that are submitting their official apps to submit a Privacy Policy even if you are not collecting any data from your users. Generate your Privacy Policy and get your unique link to submit to those platforms."),
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
                "Generate Privacy Policy for third party services",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                    "Some third party services require you to have a Privacy Policy. The use of ads, analytics or third party payments usually ask you for a Privacy Policy. Google Ads might be the one asking for your Privacy Policy, or Amazon, and many more."),
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
                "Download your Privacy Policy",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                    "If you want to host your customized Privacy Policy on your site, you can just download the Privacy Policy and give them the use you want."),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
