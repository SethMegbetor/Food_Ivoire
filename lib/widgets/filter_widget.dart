import 'package:flutter/material.dart';

// class FilterWidget extends StatefulWidget {
//   @override
//   _FilterWidgetState createState() => _FilterWidgetState();
// }

// class _FilterWidgetState extends State<FilterWidget> {
//   List<String> options = ['Option 1', 'Option 2', 'Option 3', 'Option 4'];
//   List<String> selectedOptions = [];
//   String searchQuery = '';

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         TextField(
//           onChanged: (value) {
//             setState(() {
//               searchQuery = value.toLowerCase();
//             });
//           },
//           decoration: InputDecoration(
//             labelText: 'Search',
//           ),
//         ),
//         Expanded(
//           child: ListView.builder(
//             itemCount: options.length,
//             itemBuilder: (BuildContext context, int index) {
//               final option = options[index];
//               return CheckboxListTile(
//                 title: Text(option),
//                 value: selectedOptions.contains(option),
//                 onChanged: (bool? selected) {
//                   setState(() {
//                     if (selected != null) {
//                       if (selected) {
//                         selectedOptions.add(option);
//                       } else {
//                         selectedOptions.remove(option);
//                       }
//                     }
//                   });
//                 },
//               );
//             },
//           ),
//         ),
//       ],
//     );
//   }
// }

// class FilterWidget extends StatefulWidget {
//   final Function(List<String>) onOptionsSelected;

//   const FilterWidget({required this.onOptionsSelected});

//   @override
//   _FilterWidgetState createState() => _FilterWidgetState();
// }

// class _FilterWidgetState extends State<FilterWidget> {
//   List<String> options = ['Option 1', 'Option 2', 'Option 3', 'Option 4','Option 1', 'Option 2', 'Option 3', 'Option 4','Option 1', 'Option 2', 'Option 3', 'Option 4'];
//   List<String> selectedOptions = [];
//   String searchQuery = '';

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         TextField(
//           onChanged: (value) {
//             setState(() {
//               searchQuery = value.toLowerCase();
//             });
//           },
//           decoration: InputDecoration(
//             labelText: 'Search',
//           ),
//         ),
//         Expanded(
//           child: ListView.builder(
//             itemCount: options.length,
//             itemBuilder: (BuildContext context, int index) {
//               final option = options[index];
//               return CheckboxListTile(
//                 title: Text(option),
//                 value: selectedOptions.contains(option),
//                 onChanged: (bool? selected) {
//                   setState(() {
//                     if (selected != null) {
//                       if (selected) {
//                         selectedOptions.add(option);
//                       } else {
//                         selectedOptions.remove(option);
//                       }
//                     }
//                     widget.onOptionsSelected(selectedOptions); // Callback to notify parent widget
//                   });
//                 },
//               );
//             },
//           ),
//         ),
//       ],
//     );
//   }
// }

class FilterWidget extends StatefulWidget {
  final Function(List<String>) onOptionsSelected;

  const FilterWidget({required this.onOptionsSelected});

  @override
  _FilterWidgetState createState() => _FilterWidgetState();
}

class _FilterWidgetState extends State<FilterWidget> {
  List<String> options = [
    "Milk",
    "Eggs",
    "Fish",
    "Shellfish",
    "Tree nuts",
    "Peanuts",
    "Wheat",
    "Soy",
    "Sesame",
    "Sulphites",
    "Mustard",
    "Celery",
    "Lupin",
    "Mollusks",
    "Crustaceans",
    "Red meat",
    "Stone fruits",
    "Kiwi",
    "Avocado",
    "Garlic",
    "Onions",
    "Corn",
    "Citrus fruits",
    "Berries",
    "Chocolate",
    "Coffee",
    "Legumes",
    "Quinoa",
    "Buckwheat",
    "Sunflower seeds",
    "Poultry",
    "Beef",
    "Pork",
    "Lamb",
    "Shellfish (specifically crab, lobster, or shrimp)",
    "Gluten",
    "Nightshade vegetables",
    "Peas",
    "Cabbage family",
    "Cane sugar",
    "Pineapple",
    "Melons",
    "Caffeine"
  ];
  List<String> selectedOptions = [];
  String searchQuery = '';

  List<String> getFilteredOptions() {
    if (searchQuery.isEmpty) {
      return options;
    }
    return options
        .where((option) => option.toLowerCase().contains(searchQuery))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final filteredOptions = getFilteredOptions();

    return Column(
      children: [
        TextField(
          onChanged: (value) {
            setState(() {
              searchQuery = value.toLowerCase();
            });
          },
          decoration: InputDecoration(
            labelText: 'Search',
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: filteredOptions.length,
            itemBuilder: (BuildContext context, int index) {
              final option = filteredOptions[index];
              return CheckboxListTile(
                title: Text(option),
                value: selectedOptions.contains(option),
                onChanged: (bool? selected) {
                  setState(() {
                    if (selected != null) {
                      if (selected) {
                        selectedOptions.add(option);
                      } else {
                        selectedOptions.remove(option);
                      }
                    }
                    widget.onOptionsSelected(
                        selectedOptions); // Callback to notify parent widget
                  });
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
