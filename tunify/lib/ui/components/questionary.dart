import 'package:flutter/material.dart';

class Questionary extends StatefulWidget {
  const Questionary({Key? key}) : super(key: key);

  @override
  State<Questionary> createState() => _QuestionaryState();
}

class _QuestionaryState extends State<Questionary> {
  int _selectedIndex = 0;
  List<String> choiceValue = [];
  String? selectedValue;
  int page = 0;

  final List<Map<String, dynamic>> _moodOptions = [
    {
      "choices": ["Happy", 'Sad', "Angry", "Chill", "Romantic"]
    },
    {
      "choices": ["Sad", 'Happy', "Angry", "Chill", "Romantic"]
    },
    {
      "choices": ["Chill", 'Sad', "Angry", "Happy", "Romantic"]
    },
    {
      "choices": ["Angry", 'Sad', "Happy", "Chill", "Romantic"]
    },
    {
      "choices": ["Happy", 'Romantic', "Angry", "Chill", "Sad"]
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Container(
            color: Color.fromARGB(255, 32, 27, 27),
            height: MediaQuery.of(context).size.height * .4,
            child: DropdownButton<String>(
              dropdownColor: Color.fromARGB(255, 31, 49, 31),
              isExpanded: true,
              value: selectedValue,
              onChanged: (newValue) {
                setState(() {
                  selectedValue = newValue;
                });
              },
              items: _moodOptions[page]["choices"].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 18.0),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       IconButton(
          //         onPressed: () {
          //           setState(() {
          //             if (page > 0) {
          //               _selectedIndex = 0;
          //               page--;
          //             }
          //           });
          //         },
          //         icon: const Icon(Icons.navigate_before),
          //       ),
          //       IconButton(
          //         onPressed: () {
          //           setState(() {
          //             if (page < _moodOptions.length - 1) {
          //               _selectedIndex = 0;
          //               page++;
          //             }
          //           });
          //         },
          //         icon: const Icon(Icons.navigate_next),
          //       ),
          //     ],
          //   ),
          // )
        ],
      ),
    );
  }
}
