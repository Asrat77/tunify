import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:tunify/ui/components/appbar.dart';

class languageScreen extends StatelessWidget {
  const languageScreen({Key? key}) : super(key: key);
  

  @override
  
  Widget build(BuildContext context) {
    return Scaffold(
     
      backgroundColor: Color.fromARGB(255, 51, 55, 56),
      appBar: MyAppbar(),
    
      body: Container(
      
        child: Column(

          children: [
            ListTile(
              onTap: () => Locales.change(context, 'en'),
              title: LocaleText('english'),
            ),
          
            ListTile(
              title: const LocaleText('spanish'),
              onTap: () => Locales.change(context, 'es')
             
              
            ),
          
            ListTile(
              title: const LocaleText('arabic'),
              
              onTap: () => Locales.change(context, 'ar')
            ),
              ListTile(
              title: const LocaleText('amharic'),
              onTap: () => Locales.change(context, 'am')
            ),
             Container(
              // Color.fromARGB(255, 65, 65, 73),
              margin: EdgeInsets.only(top: 100.0),
              width: MediaQuery.of(context).size.width*1.0,
              height: MediaQuery.of(context).size.height*0.12,
              // color: (Colors.blueGrey[900]),
               child: Column(
             
                mainAxisAlignment: MainAxisAlignment.center,
                
                 children: [
                  
                   LocaleText('currentlanguageis',style: TextStyle(color: Colors.white),),
               
                  Text(Locales.currentLocale(context)!.languageCode,style: TextStyle(color: Colors.white),),   ],
               ),
             ),
     
            ],
            
        ),
        
       ),
    );
  }
}