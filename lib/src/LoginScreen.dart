// import 'package:flutter/material.dart';
// import 'package:agri_business_advisor/src/MainActivity.dart';

// class LoginActivity extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         width: double.infinity,
//         height: double.infinity,
//         decoration: BoxDecoration(
//           image: DecorationImage(
//             image: AssetImage('assets/background6.jpg'),
//             fit: BoxFit.cover,
//           ),
//         ),
//         child: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 60.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Image.asset(
//                   'assets/ic_launch11.jpg',
//                   width: 192,
//                   height: 145,
//                 ),
//                 SizedBox(height: 30),
//                 Text(
//                   'Sign in',
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 32,
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//                 SizedBox(height: 20),
//                 _buildTextField(
//                   hintText: 'Username',
//                   icon: Icons.person_outline,
//                 ),
//                 SizedBox(height: 15),
//                 _buildTextField(
//                   hintText: 'Password',
//                   icon: Icons.lock_outline,
//                   obscureText: true,
//                 ),
//                 SizedBox(height: 30),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     _buildButton(
//                       text: 'LOGIN',
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(builder: (context) => MainActivity()),
//                         );
//                       },
//                       context: context
//                     ),
//                     _buildButton(
//                       text: 'REGISTER',
//                       onPressed: () {},
//                       context: context

//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 20),
//                 TextButton(
//                   onPressed: () {},
//                   child: Text(
//                     'Forgot Password?',
//                     style: TextStyle(color: Colors.white70),
//                   ),
//                 ),
//                 SizedBox(height: 30),
//                 GestureDetector(
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) => MainActivity()),
//                     );
//                   },
//                   child: Text(
//                     'Continue Without Sign in',
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildTextField({String? hintText, IconData? icon, bool obscureText = false}) {
//     return TextField(
//       obscureText: obscureText,
//       decoration: InputDecoration(
//         hintText: hintText,
//         hintStyle: TextStyle(color: Colors.white70),
//         filled: true,
//         fillColor: Colors.black.withOpacity(0.3),
//         prefixIcon: Icon(icon, color: Colors.white70),
//         contentPadding: EdgeInsets.all(20),
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(15),
//           borderSide: BorderSide.none,
//         ),
//       ),
//       style: TextStyle(color: Colors.white),
//     );
//   }

//   Widget _buildButton({String? text, VoidCallback? onPressed, BuildContext? context}) {
//     return MaterialButton(
//       onPressed: onPressed,
//       color: Theme.of(context! ).colorScheme.secondary,
//       padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(10),
//       ),
//       child: Text(
//         text!,
//         style: TextStyle(color: Colors.white, fontSize: 16),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:agri_business_advisor/src/MainActivity.dart';

class LoginActivity extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        // decoration: BoxDecoration(
        //   gradient: LinearGradient(
        //     colors: [Colors.green.shade700, Colors.green.shade500],
        //     begin: Alignment.topCenter,
        //     end: Alignment.bottomCenter,
        //   ),
        // ),
         decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background5.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.green.withOpacity(0.7), BlendMode.color),
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 60.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/ic_launch1.png',
                  width: 150,
                  height: 150,
                ),
                SizedBox(height: 30),
                Text(
                  'Welcome Back',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                _buildTextField(
                  hintText: 'Username',
                  icon: Icons.person,
                ),
                SizedBox(height: 15),
                _buildTextField(
                  hintText: 'Password',
                  icon: Icons.lock,
                  obscureText: true,
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildButton(
                      text: 'LOGIN',
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MainActivity()),
                        );
                      },
                      context: context,
                    ),
                    _buildButton(
                      text: 'REGISTER',
                      onPressed: () {},
                      context: context,
                    ),
                  ],
                ),
                SizedBox(height: 20),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Forgot Password?',
                    style: TextStyle(color: Colors.white70),
                  ),
                ),
                SizedBox(height: 30),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MainActivity()),
                    );
                  },
                  child: Text(
                    'Continue Without Sign in',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({String? hintText, IconData? icon, bool obscureText = false}) {
    return TextField(
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.green.shade100),
        filled: true,
        fillColor: Colors.green.shade900.withOpacity(0.4),
        prefixIcon: Icon(icon, color: Colors.green.shade100),
        contentPadding: EdgeInsets.all(20),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
      ),
      style: TextStyle(color: Colors.white),
    );
  }

  Widget _buildButton({String? text, VoidCallback? onPressed, BuildContext? context}) {
    return MaterialButton(
      onPressed: onPressed,
      color: Colors.orange.shade700,
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      child: Text(
        text!,
        style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }
}

