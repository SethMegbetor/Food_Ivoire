// import 'package:flutter/material.dart';

import 'prefered_dish_filter.dart';

// class SignupPage extends StatefulWidget {
//   @override
//   _SignupPageState createState() => _SignupPageState();
// }

// class _SignupPageState extends State<SignupPage> {
//   TextEditingController _usernameController = TextEditingController();
//   TextEditingController _passwordController = TextEditingController();

//   void _navigateToNextScreen() {
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => SuccessPage(username: _usernameController.text),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Signup'),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             TextFormField(
//               controller: _usernameController,
//               decoration: InputDecoration(
//                 labelText: 'Username',
//               ),
//             ),
//             SizedBox(height: 16.0),
//             TextFormField(
//               controller: _passwordController,
//               obscureText: true,
//               decoration: InputDecoration(
//                 labelText: 'Password',
//               ),
//             ),
//             SizedBox(height: 16.0),
//             ElevatedButton(
//               onPressed: () {
//                 String username = _usernameController.text;
//                 String password = _passwordController.text;
//                 // Perform signup logic here
//                 // e.g., make an API call to create a new account

//                 // Reset the text fields
//                 _usernameController.clear();
//                 _passwordController.clear();

//                 // Navigate to the success page
//                 _navigateToNextScreen();
//               },
//               child: Text('Sign up'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class SuccessPage extends StatelessWidget {
//   final String username;

//   SuccessPage({required this.username});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Success'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Icon(
//               Icons.check_circle,
//               size: 80.0,
//               color: Colors.green,
//             ),
//             SizedBox(height: 16.0),
//             Text(
//               'Signup Successful',
//               style: TextStyle(fontSize: 24.0),
//             ),
//             SizedBox(height: 16.0),
//             TextButton(
//               onPressed: () {
//                 // Navigate to another page
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => FilterScreen(),
//                   ),
//                 );
//               },
//               style: TextButton.styleFrom(
//                 padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
//                 backgroundColor: Colors.blue,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(8.0),
//                 ),
//               ),
//               child: Text(
//                 'Welcome, $username!',
//                 style: TextStyle(fontSize: 18.0, color: Colors.white),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  String? _selectedCountry; // Change the type to String?

  List<String> africanCountries = [
    'Algeria',
    'Angola',
    'Benin',
    'Botswana',
    'Burkina Faso',
    'Burundi',
    // Add more African countries here...
  ];

  void _navigateToNextScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SuccessPage(
          username: _usernameController.text,
          country: _selectedCountry,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Signup'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: 'Username',
              ),
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
            ),
            SizedBox(height: 16.0),
            DropdownButtonFormField<String>(
              value: _selectedCountry,
              decoration: InputDecoration(
                labelText: 'Country',
              ),
              onChanged: (value) {
                setState(() {
                  _selectedCountry = value;
                });
              },
              items: africanCountries.map((country) {
                return DropdownMenuItem<String>(
                  value: country,
                  child: Text(country),
                );
              }).toList(),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                String username = _usernameController.text;
                String password = _passwordController.text;
                // Perform signup logic here
                // e.g., make an API call to create a new account

                // Reset the text fields
                _usernameController.clear();
                _passwordController.clear();

                // Navigate to the success page
                _navigateToNextScreen();
              },
              child: Text('Sign up'),
            ),
          ],
        ),
      ),
    );
  }
}

class SuccessPage extends StatelessWidget {
  final String username;
  final String? country; // Change the type to String?

  SuccessPage({required this.username, required this.country});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Success'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.check_circle,
              size: 80.0,
              color: Colors.green,
            ),
            SizedBox(height: 16.0),
            Text(
              'Signup Successful',
              style: TextStyle(fontSize: 24.0),
            ),
            SizedBox(height: 16.0),
            Text(
              'Country: ${country ?? ""}', // Add null check using ??
              style: TextStyle(fontSize: 18.0),
            ),
             SizedBox(height: 16.0),
            TextButton(
              onPressed: () {
                // Navigate to another page
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FilterScreen(),
                  ),
                );
              },
              style: TextButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: Text(
                'Next, $username!',
                style: TextStyle(fontSize: 18.0, color: Colors.white),
              ),
            ),
            // Text(
            //   'Welcome, $username!',
            //   style: TextStyle(fontSize: 18.0),
            // ),
            SizedBox(height: 16.0),
          ],
        ),
      ),
    );
  }
}
