import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class home_screen extends StatefulWidget {
  const home_screen({super.key});

  @override
  State<home_screen> createState() => _home_screenState();
}

class _home_screenState extends State<home_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        itemBuilder: (BuildContext context, int index) {
          return SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  
                  height: MediaQuery.of(context).size.height * 0.31,
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: Card(

                     color: Colors.grey,
                     
                      
                   
                      child: Column(
                        children: [
                          Image.network('https://i.pinimg.com/236x/31/88/9c/31889c1cba75cd87a35daca51e2d366e.jpg',  width: MediaQuery.of(context).size.width*0.5,),
                        ],
                      ))),
                    
                  
              ]
              
            ),
          );
        },
      ),
    );
  }
}
