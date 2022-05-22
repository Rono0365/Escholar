import 'package:flutter/material.dart';

class Gradebook extends StatelessWidget {
  const Gradebook({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Student's Transcript"),centerTitle: true,),
      body:Center(
        child: Card(
          child:Column(
            children: [
              ListTile(
                title: Text("Subject"),
                trailing: Text("Grade"),
              )
            ],
          )
          
        ),
      )
      
    );
  }
  
}
class fees extends StatelessWidget {
  const fees({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("School fees details"),centerTitle: true,),
      body:Center(
        child: Card(
          child:Column(
            children: [
              ListTile(
                title: Text("Amount"),
                trailing: Text("date"),
              )
            ],
          )
          
        ),
      ),
      bottomNavigationBar: ListTile(title: Text("Balance"),trailing: Text("Amount remaining"),),
      
    );
  }
}

class contacts extends StatelessWidget {
  const contacts({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Contact us"),centerTitle: true,),
      body:Center(
        child: Card(
          child:Column(
            children: [
              ListTile(
                title: Text("Email"),
                trailing: Text("__"),
              ),
              ListTile(
                title: Text("Phone:"),
                trailing: Text("__"),
              ),
              ListTile(
                title: Text("website:"),
                trailing: Text("__"),
              ),
            ],
          )
          
        ),
      )
      
    );
  }
}
class teachers extends StatelessWidget {
  const teachers({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Teachers"),centerTitle: true,),
      body:Center(
        child: Card(
          child:Column(
            children: [
              ListTile(
                title: Text("Teacher"),
                trailing: Text("Subject"),
              )
            ],
          )
          
        ),
      )
      
    );
  }
}
class help extends StatelessWidget {
  const help({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Contact us"),centerTitle: true,),
      body:Center(
        child: Card(
          child:Column(
            children: [
              ListTile(
                title: Text("call"),
                trailing: Text("__"),
              ),
            ],
          )
          
        ),
      )
      
    );
  }
}

class cal extends StatelessWidget {
  const cal({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child:Text("not yet updated")),
    );
  }
}

