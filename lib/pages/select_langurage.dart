import 'package:flutter/material.dart';

import 'get_started_english.dart';
import 'get_started_french.dart';

class LanguageSelectionPage extends StatefulWidget {
  @override
  _LanguageSelectionPageState createState() => _LanguageSelectionPageState();
}

class _LanguageSelectionPageState extends State<LanguageSelectionPage> {
  late String selectedLanguage;

  List<String> languages = [
    'English',
    'French',
    // Add more languages here
  ];

  @override
  void initState() {
    selectedLanguage = languages[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFFE7CEC7), // Background color
        child: Stack(
          children: [
            Image.asset(
              'assets/get_started_background.jpg',
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.6), // Dark overlay
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Select Your Language',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        width: 200,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Color(0xFFE7CEC7),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: DropdownButtonFormField(
                          value: selectedLanguage,
                          onChanged: (newValue) {
                            setState(() {
                              selectedLanguage = newValue!;
                            });
                          },
                          items: [
                            DropdownMenuItem(
                              value: 'English',
                              child: Text('English',
                                  style: TextStyle(color: Colors.black)),
                            ),
                            DropdownMenuItem(
                              value: 'French',
                              child: Text('French',
                                  style: TextStyle(color: Colors.black)),
                            ),
                          ],
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 16, vertical: 12),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            fillColor: Color(0xFFE7CEC7),
                            filled: true,
                          ),
                          style: TextStyle(color: Colors.black),
                          dropdownColor: Color(0xFFE7CEC7),
                          icon: Icon(Icons.arrow_drop_down),
                          iconEnabledColor: Colors.black,
                          isExpanded: true,
                          elevation: 2,
                        ),
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          // Perform action when the "Select" button is pressed
                          // For example, navigate to different pages based on the selected language
                          if (selectedLanguage == 'English') {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => GetStartedEnglish(),
                              ),
                            );
                          } else if (selectedLanguage == 'French') {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => GetStartedFrench(),
                              ),
                            );
                          }
                        },
                        child: Text('Select'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class EnglishPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('English Page'),
      ),
      body: Center(
        child: Text('Welcome to the English page!'),
      ),
    );
  }
}

class FrenchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('French Page'),
      ),
      body: Center(
        child: Text('Bienvenue à la page en français !'),
      ),
    );
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Language Selection Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: LanguageSelectionPage(),
    );
  }
}
