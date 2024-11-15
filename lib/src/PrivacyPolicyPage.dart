import 'package:flutter/material.dart';


class PrivacyPolicyPage extends StatefulWidget {
  const PrivacyPolicyPage({super.key});

  @override
  State<PrivacyPolicyPage> createState() => _PrivacyPolicyPageState();
}

class _PrivacyPolicyPageState extends State<PrivacyPolicyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Privacy Policy'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 16.0,horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Agro-Ecology Advisor Privacy Policy',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Last Updated: 29/09/2024',
              style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
            ),
            SizedBox(height: 20),
            Text(
              'Welcome to the Agro-Ecology Advisor application. Your privacy is important to us. '
              'This Privacy Policy explains how we handle your personal information when you use our application. '
              'We are committed to maintaining the trust and confidence of all users. Please read this Privacy Policy carefully '
              'to understand our practices regarding your privacy.',
              style: TextStyle(fontSize: 16),
              
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 20),
            Text(
              '1. No Data Collection',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'The Agro-Ecology Advisor application does not collect, store, or process any personal data from its users. '
              'This includes but is not limited to:\n'
              '- Personal identifiers such as your name, email, or phone number.\n'
              '- Location data.\n'
              '- Usage statistics or behavior tracking.\n'
              'Our app is designed to provide educational content about sustainable agricultural practices, including mushroom cultivation and beekeeping, '
              'without the need to gather personal data.',
              style: TextStyle(fontSize: 16),
              
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 20),
            Text(
              '2. Purpose of the Application',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'The Agro-Ecology Advisor app is purely an educational tool designed to help farmers and individuals improve their understanding of agro-ecology, '
              'specifically in areas such as mushroom cultivation and beekeeping. It offers information, tips, and advice on how to best approach these practices for sustainable farming.',
              style: TextStyle(fontSize: 16),
              
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 20),
            Text(
              '3. No Third-Party Data Sharing',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Since the app does not collect any personal information, no data will be shared with third parties. '
              'This includes third-party service providers, advertisers, or any other external entities.',
              style: TextStyle(fontSize: 16),
              
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 20),
            Text(
              '4. Security',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Although the app does not handle personal data, we are still committed to ensuring that the app remains secure and functions smoothly for all users. '
              'We regularly monitor and update the app to ensure a safe and secure experience.',
              style: TextStyle(fontSize: 16),
              
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 20),
            Text(
              '5. External Links',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'The app may contain links to external websites or resources. Please note that once you leave our app, we have no control over the privacy practices or content of those third-party sites. '
              'We recommend reviewing the privacy policies of any external sites you visit through the app.',
              style: TextStyle(fontSize: 16),
              
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 20),
            Text(
              '6. Changes to This Privacy Policy',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'We may update this Privacy Policy from time to time to reflect changes in our services or legal requirements. '
              'Any changes will be posted on this page, and we encourage you to review this policy periodically. '
              'The "Last Updated" date at the top will indicate when the latest changes were made.',
              style: TextStyle(fontSize: 16),
              
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 20),
            Text(
              '7. Contact Us',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'If you have any questions or concerns about this Privacy Policy or your experience with the Agro-Ecology Advisor app, '
              'please feel free to contact us at:\n\n'
              'Phone: +263 77 634 8601\n'
              'Email: rimaafrika4@gmail.com\n'
              'Country: Zimbabwe',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 20),
            Text(
              'Thank you for using the Agro-Ecology Advisor application and for supporting sustainable farming practices!',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}