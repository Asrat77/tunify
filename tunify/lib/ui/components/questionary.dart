import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Questionary extends StatefulWidget {
  const Questionary( {super.key});

  @override
  State<Questionary> createState() => _QuestionaryState();
}

class _QuestionaryState extends State<Questionary> {
  int _selectedIndex = 0;
  List? choiceValue;
  String? values;

  bool isRadioSelected = false;

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
      child: Container(
        child: ListView.builder(
          itemCount: _moodOptions.length,
          itemBuilder: (BuildContext context, int index) {
            return Center(
              child: ListTile(
                  leading: 
                  
                  
                  Column(
                    children: [
                    
                      Radio(
                        groupValue: _selectedIndex,
                        focusColor: Colors.amber,
                        onChanged: (int? value) async {
                          setState(() {
                            choiceValue = _moodOptions[index]["choices"];
                          });
                          // if (_selectedIndex < 4) _selectedIndex++;
                          // print(choiceValue![_selectedIndex++]);
            
                          // while (!isRadioSelected) {
                          //   await Future.delayed(Duration(
                          //       milliseconds:
                          //           100)); // Wait for 100ms to avoid blocking the UI thread
                          //   if (_selectedIndex != null) {
                          //     print('Selected value is: $_selectedIndex');
                          //     isRadioSelected = true;
                          //   }
                          // }
                          value = index;
                          _selectedIndex = value;
                        }, value: index,
                      ),
                    ],
                  ),
                  // title: Text(values?.toString() ?? ''),
                  title: Text(choiceValue?[index].toString() ?? "")),
            );
                
        },
        ),
      
      ),
    );

    
  }
}
