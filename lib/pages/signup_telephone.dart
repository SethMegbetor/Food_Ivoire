import 'package:flutter/material.dart';

class SignupTelephonePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFEFDF5),
      appBar: AppBar(
        title: Text('Inscription étape 1'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Food  Ivoire',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Saisissez votre numéro de telephone',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(height: 24),
            TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.phone),
                hintText: 'Numéro de téléphone',
              ),
            ),
            SizedBox(height: 48),
            ElevatedButton(
              onPressed: () {
                // Perform submit action
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
                minimumSize: Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                'Submit',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
