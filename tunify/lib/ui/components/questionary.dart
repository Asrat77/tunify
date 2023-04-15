import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Questionary extends StatefulWidget {
  const Questionary({super.key});

  @override
  State<Questionary> createState() => _QuestionaryState();
}

class _QuestionaryState extends State<Questionary> {
  int _selectedIndex = 0;
  List choiceValue = [];
  String? values;
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
            height: MediaQuery.of(context).size.height * .4,
            child: ListView.builder(
              itemCount: _moodOptions[page]["choices"].length,
              itemBuilder: (BuildContext context, int index) {
                choiceValue = _moodOptions[page]["choices"];
                return ListTile(
                    leading: Radio(
                      groupValue: _selectedIndex,
                      focusColor: Colors.amber,
                      onChanged: (int? value) {
                        setState(() {
                          _selectedIndex = value!;
                        });

                        // if (_selectedIndex < 4) _selectedIndex++;
                        // print(choiceValue![_selectedIndex++]);
                      },
                      value: index,
                    ),
                    // title: Text(values?.toString() ?? ''),
                    title: Text(choiceValue[index]));
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  
                  onPressed: () {
                    setState(() {
                      if (page > 0) {
                        _selectedIndex = 0;
                        page--;
                      }
                    });
                  },
                  icon: const Icon(Icons.navigate_before),
                ),
                IconButton(
                  
                  onPressed: () {
                    setState(() {
                      if (page < _moodOptions.length - 1) {
                        _selectedIndex = 0;
                        page++;
                      }
                    });
                  },
                  icon: const Icon(Icons.navigate_next),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}