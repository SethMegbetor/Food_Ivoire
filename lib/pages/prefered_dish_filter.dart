import 'package:flutter/material.dart';
import '../models/item_model.dart';
import 'alergy_filter.dart';
// import 'package:flutter_filter_chips_demo/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      debugShowCheckedModeBanner: false,
      // home: const Splash(),
    );
  }
}

class FilterScreen extends StatefulWidget {
  const FilterScreen({Key? key}) : super(key: key);

  @override
  _FilterScreenState createState() {
    return _FilterScreenState();
  }
}

class _FilterScreenState extends State<FilterScreen> {
  bool selected = false;
  final List<ItemModel> _chipsList = [
    ItemModel("African Dish", Colors.green, false),
    ItemModel("Lebanese dish", Colors.blueGrey, false),
    ItemModel("Nigerian dish", Colors.deepOrange, false),
    ItemModel("Others", Colors.cyan, false),
    // ItemModel("React JS", Colors.teal, false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Select Your Prefered Dish",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Image.asset(
              "assets/images/search.png",
              height: 150,
              width: 150,
            ),
            SizedBox(
              height: 20,
            ),
            Wrap(
              spacing: 8,
              direction: Axis.horizontal,
              children: filterChipsList(),
            ),
            SizedBox(
              height: 30,
            ),
            TextButton(
              onPressed: () {
                // Navigate to another page
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Alergy(),
                  ),
                );
              },
              style: TextButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
                backgroundColor: Colors.orange,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: Text(
                'Done',
                style: TextStyle(fontSize: 18.0, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> filterChipsList() {
    List<Widget> chips = [];
    for (int i = 0; i < _chipsList.length; i++) {
      Widget item = Padding(
        padding: const EdgeInsets.only(left: 10, right: 5),
        child: FilterChip(
          label: Text(_chipsList[i].label),
          labelStyle: const TextStyle(color: Colors.white, fontSize: 16),
          backgroundColor: _chipsList[i].color,
          selected: _chipsList[i].isSelected,
          onSelected: (bool value) {
            setState(() {
              _chipsList[i].isSelected = value;
            });
          },
        ),
      );
      chips.add(item);
    }
    return chips;
  }
}
