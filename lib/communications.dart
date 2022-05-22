import 'package:flutter/material.dart';

class communications extends StatelessWidget {
  const communications({Key? key, required this.title1}) : super(key: key);
  final List title1;

  @override
  Widget build(BuildContext context) {
    List title1 = ['hello', 'i am ', 'Rono'];
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Card(
            elevation:0.0,
            child:Column(children:[
            ListTile(
              title:Text("E-Classrooms"),


            ),
            
          ...this.title1.map(
            (i) => ListTile(
             
              trailing: CircleAvatar(
                radius: 10,
                backgroundColor: Colors.white,
                child: Center(
                    child: Icon(Icons.notifications,color: Colors.red,size: 12))           ),
              title: Text(
                i['name'].toString(),
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(i['deadline']),
              onTap: () {
                /*Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Chatscreen(
                      titlex: i['unit_name'],
                      title: i,
                    ),
                  ), //MaterialPageRoute
                );*/
                //navigate
              },
            ),
          ),])),

        ],
      ),
    ));
  }
}
