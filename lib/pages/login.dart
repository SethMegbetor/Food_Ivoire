import 'package:flutter/material.dart';

import 'homepage.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFEFDF5),
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.email),
                hintText: 'Telephone/Email',
              ),
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.lock),
                hintText: 'Password',
              ),
              obscureText: true,
            ),
            SizedBox(height: 48),
            ElevatedButton(
              onPressed: () {
                // Perform login action
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                minimumSize: Size(200, 48), // Set width and height
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8), // Set border radius
                ),
              ),
              child: Text(
                'Login',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
