import 'package:agri_business_advisor/src/LoginScreen.dart';
import 'package:agri_business_advisor/src/PrivacyPolicyPage.dart';
import 'package:agri_business_advisor/src/ProfilePage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _notificationsEnabled = false;
  //bool _darkMode = false;
  String _selectedLanguage = 'English';

  void _changeLanguage(String? newLanguage) {
    if (newLanguage != null) {
      setState(() {
        _selectedLanguage = newLanguage;
      });
    }
  }

  void _showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.black,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Settings')),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          Text(
            'General',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          ListTile(
            title: Text('Notifications'),
            subtitle: Text(
                'Receive notifications about crop recommendations, weather alerts, and updates'),
            trailing: Switch(
              value: _notificationsEnabled,
              onChanged: (value) {
                setState(() {
                  _notificationsEnabled = value;
                  // Show toast message based on the switch state
                  String toastMessage = _notificationsEnabled
                      ? 'Notifications enabled'
                      : 'Notifications disabled';
                  _showToast(toastMessage);
                });
              },
            ),
          ),
          ListTile(
            title: Text('Language'),
            subtitle: Text('Select preferred language'),
            trailing: DropdownButton<String>(
              value: _selectedLanguage,
              items: [
                DropdownMenuItem(
                  child: Text('English'),
                  value: 'English',
                ),
              ],
              onChanged: _changeLanguage,
            ),
          ),
          SizedBox(height: 20),
          // Text(
          //   'Display',
          //   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          // ),
          // ListTile(
          //   title: Text('Dark Mode'),
          //   subtitle: Text('Switch between light and dark themes'),
          //   trailing: Switch(
          //     value: _darkMode,
          //     onChanged: (value) {
          //       setState(() {
          //         _darkMode = value;
          //       });
          //     },
          //   ),
          // ),
          SizedBox(height: 20),
          Text(
            'Account',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          ListTile(
            title: Text('Profile'),
            subtitle: Text('Edit your profile settings'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage()),
              );
            },
            trailing: Icon(Icons.arrow_forward_ios),
          ),
        
          ListTile(
            title: Text('Privacy Policy'),
            subtitle: Text('Read about our data protection and usage policies'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PrivacyPolicyPage()),
              );
            },
            trailing: Icon(Icons.arrow_forward_ios),
          ),

          SizedBox(height: 20),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
            ),
            onPressed: () {
              Navigator.pop(context);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginActivity()),
                );
            },
            child: Text('Log Out'),
          ),
        ],
      ),
    );
  }
}
