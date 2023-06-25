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
        appBar: AppBar(backgroundColor: Color.fromARGB(255, 8, 185, 100),
          title: Text("What are you allergic to"),
        ),
        body: FilterWidget(onOptionsSelected: handleSelectedOptions),
        floatingActionButton: FloatingActionButton(backgroundColor: Colors.orange,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          },
          child: Icon(Icons.done, color: Colors.white),
        ),
      ),
    );
  }
}

// void main() {
//   runApp(Alergy());
// }
