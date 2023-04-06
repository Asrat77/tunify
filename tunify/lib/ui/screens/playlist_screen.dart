import 'package:flutter/material.dart';

// ignore: camel_case_types
class Playlistpage extends StatelessWidget {
  const Playlistpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'g',
      
    );
  }
}

// ignore: camel_case_types
class Playlist extends StatefulWidget {
  const Playlist({super.key});

  @override
  State<Playlist> createState() => _PlaylistState();
}

// ignore: camel_case_types
class _PlaylistState extends State<Playlist> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: Colors.black,
    
     
      body:SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            
            Container(
              margin: EdgeInsets.fromLTRB(16.0, 16.0, 0.0, 8.0),
              child: Text(
                'My Playlist',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    
                       decoration: BoxDecoration(border: Border.all(width: 7,color: Colors.white10),borderRadius: BorderRadius.circular(10)),
                    child: ListTile(
                      
                      leading: Container(
                     
                        child: CircleAvatar(
                          
                          child: Container(child: Icon(Icons.music_note,color: Colors.black,)),backgroundColor: Colors.green,
                        ),
                      ),
                      
                      title: Text('Title',style: TextStyle(color: Colors.white24),),
                      subtitle: Text('Artist ',style: TextStyle(color: Colors.white)),
                      trailing: Icon(Icons.more_vert,color: Colors.green,),
                    ),
                  );
                },
              ),
            ),
            
          ],
        ),
        
      ),
      
    );
  }
}
