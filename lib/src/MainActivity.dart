import 'package:agri_business_advisor/src/BeePage.dart';
import 'package:agri_business_advisor/src/LoginScreen.dart';
import 'package:agri_business_advisor/src/ModelFarmer.dart';
import 'package:agri_business_advisor/src/Mushroom.dart';
import 'package:agri_business_advisor/src/ProfilePage.dart';
import 'package:agri_business_advisor/src/SettingsPage.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'DatabaseHelper.dart';
import 'dart:io';

class MainActivity extends StatefulWidget {
  const MainActivity({super.key});

  @override
  State<MainActivity> createState() => _MainActivityState();
}

class _MainActivityState extends State<MainActivity> {



String? displayName;
  String? email;
  String? imagePath;

  @override
  void initState() {
    super.initState();
    _loadProfile();
  }

  Future<void> _loadProfile() async {
    final profile = await DatabaseHelper().getProfile();
    setState(() {
      displayName = profile?['name'] ?? 'Guest User';
      email = profile?['email'] ?? 'guest@example.com';
       imagePath = profile?['imagePath']; // Get the image path from DB
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.green[700],
        centerTitle: true,
        title: Text(
          'Home',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      drawer: _buildDrawer(context),
      body: Container(
         height:MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background5.jpg'),
            fit: BoxFit.cover,
           
            colorFilter: ColorFilter.mode(
                Colors.green.withOpacity(0.2), BlendMode.darken),
          ),
        ),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildHeader(),
                SizedBox(height: 20),
                _buildFeatureCard(
                  context,
                  title: 'Mushroom',
                  description: 'Mushroom Production for beginners',
                  imageUrl: 'assets/mushroom.png',
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Mushroom()),
                  ),
                ),
                SizedBox(height: 10),
                _buildFeatureCard(
                  context,
                  title: 'Bee Keeping',
                  description:
                      'Study nature, love nature, and be the best bee keeper',
                  imageUrl: 'assets/bee_keeping.png',
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const BeeKeeping()),
                  ),
                ),
                SizedBox(height: 10),
                _buildFeatureCard(
                  context,
                  title: 'Model Farmer',
                  description: 'Get the best info on model farming',
                  imageUrl: 'assets/model_farmer.png',
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ModelFarmer()),
                  ),
                ),
                SizedBox(height: 10),
                _buildContactInfoCard(width),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showFABMenu(context),
        backgroundColor: Colors.green[800],
        child: Icon(Icons.more_vert_outlined, color: Colors.white),
      ),
    );
  }

  Widget _buildDrawer(BuildContext context) {
    return Drawer(

      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
         UserAccountsDrawerHeader(
            accountName: Text(displayName ?? 'Loading...'),
            accountEmail: Text(email ?? 'Loading...'),
            currentAccountPicture: imagePath != null
                ? CircleAvatar(
                    backgroundImage: FileImage(File(imagePath!)), // Load image from local file system
                  )
                : CircleAvatar(
                    backgroundImage: AssetImage('assets/profile_blank.png'),
                  ),
            decoration: BoxDecoration(
              color: Colors.green[700],
            ),
          ),
          _buildDrawerItem(
            icon: Icons.home,
            text: 'Home',
            onTap: (){
               Navigator.pop(context);
               Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MainActivity()),
            );
            } 
          ),
          _buildDrawerItem(
            icon: Icons.settings,
            text: 'Settings',
            onTap: (){
  Navigator.pop(context);
               Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SettingsPage()),
            );
            }
          ),
          _buildDrawerItem(
            icon: Icons.logout,
            text: 'Logout',
            onTap: () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => LoginActivity()),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerItem(
      {required IconData icon, required String text, VoidCallback? onTap}) {
    return ListTile(
      leading: Icon(icon, color: Colors.green[800]),
      title: Text(text),
      onTap: onTap,
    );
  }

  Widget _buildHeader() {
    return Column(
      children: [
        Text(
          'Agro-Ecology Advisor',
          style: TextStyle(
            fontSize: 28,
            color: Colors.green[900],
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 10),
        Text(
          'We are here to help you make the best out of your farm',
          style: TextStyle(
            fontSize: 16,
            color: Colors.green[700],
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildFeatureCard(BuildContext context,
      {required String title,
      required String description,
      required String imageUrl,
      required VoidCallback onTap}) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 5,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(15),
        child: Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.green[200],
          ),
          child: Row(
            children: [
              Image.asset(imageUrl, height: 80, width: 80, fit: BoxFit.cover),
              SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.green[900],
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      description,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.green[800],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContactInfoCard(double width) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.green[200],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Contact Info',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.green[900],
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 15),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildContactInfo(
                    'assets/phone.jpg',
                    'Phone',
                    '+263 776 348 601',
                    () => _callMe(),
                  ),
                  SizedBox(width: 10),
                  _buildContactInfo(
                    'assets/email.png',
                    'Email',
                    'rimaafrika4@gmail.com',
                    () => _emailMe(),
                  ),
                  SizedBox(width: 10),
                  _buildContactInfo(
                    'assets/whatsapp.png',
                    'WhatsApp',
                    '+263 776 348 601',
                    () => _sendWhatsapp(),
                  ),
                  SizedBox(width: 10),
                  _buildContactInfo(
                    'assets/twitter.png',
                    'Twitter',
                    '@AfrikaRima',
                    () => _goToTwitter(),
                  ),
                  SizedBox(width: width / 6),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContactInfo(
      String iconUrl, String label, String content, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Image.asset(iconUrl, width: 30),
          SizedBox(height: 5),
          Text(
            label,
            style: TextStyle(color: Colors.green[900]),
          ),
          Text(
            content,
            style: TextStyle(color: Colors.green[800]),
          ),
        ],
      ),
    );
  }

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void _callMe() {
    _launchURL("tel:+263776348601");
  }

  void _sendWhatsapp() {
    _launchURL("https://api.whatsapp.com/send?phone=263776348601");
  }

  void _emailMe() {
    _launchURL("mailto:rimaafrika4@gmail.com");
  }

  void _goToTwitter() {
    _launchURL("https://twitter.com/AfrikaRima");
  }

  void _showFABMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Wrap(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.person, color: Colors.green[800]),
              title: Text('Profile'),
              onTap: () {
                Navigator.pop(context);
 Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfilePage()),
            );


              },
            ),
            ListTile(
              leading: Icon(Icons.settings, color: Colors.green[800]),
              title: Text('Settings'),
              onTap: () {
                Navigator.pop(context);
                
                 Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SettingsPage()),
            );

               
              },
            ),
            ListTile(
              leading: Icon(Icons.logout, color: Colors.green[800]),
              title: Text('Logout'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginActivity()),
                );
              },
            ),
          ],
        );
      },
    );
  }
}
