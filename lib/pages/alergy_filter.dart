import 'package:flutter/material.dart';
import '../widgets/filter_widget.dart';
import 'homepage.dart';
// import 'filter_widget.dart';

class Alergy extends StatelessWidget {
  void handleSelectedOptions(List<String> selectedOptions) {
    // Perform action with selected options
    print('Selected Options: $selectedOptions');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Allergy Filter',
      home: Scaffold(
        appBar: AppBar(
          title: Text("What are you allergic to"),
        ),
        body: FilterWidget(onOptionsSelected: handleSelectedOptions),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          },
          child: Icon(Icons.done),
        ),
      ),
    );
  }
}

// void main() {
//   runApp(Alergy());
// }
