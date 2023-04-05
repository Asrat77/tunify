import 'package:flutter/material.dart';

// ignore: camel_case_types
class homepage extends StatelessWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'g',
      home: home(),
    );
  }
}

// ignore: camel_case_types
class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

// ignore: camel_case_types
class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: Colors.black,
      appBar: AppBar(
        
        title: const Text('tunetailor'),
        toolbarHeight: 90,
        backgroundColor: Colors.black,
        actions: [IconButton(onPressed: (){}, icon: Icon(Icons.account_box))],
        
       
      ),
     
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.fromLTRB(16.0, 16.0, 0.0, 8.0),
            child: Text(
              'My Playlist',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: CircleAvatar(
                    
                    child: Container(child: Icon(Icons.music_note,color: Colors.black,)),backgroundColor: Colors.green,
                  ),
                  
                  title: Text('Title',style: TextStyle(color: Colors.white24),),
                  subtitle: Text('Artist ',style: TextStyle(color: Colors.white)),
                  trailing: Icon(Icons.more_vert,color: Colors.green,),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
