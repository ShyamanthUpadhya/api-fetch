import 'package:flutter/material.dart';

class Slots extends StatefulWidget {
  List slots=[];
  Slots({this.slots});

  @override
  _SlotsState createState() => _SlotsState();
}

class _SlotsState extends State<Slots> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title:Text("Example"),
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: widget.slots.length,
        itemBuilder: (context,index){
          return Card(
            child: ListTile(
              onTap:(){} ,
              title:Text(widget.slots[index]['name'],
              style: TextStyle(fontSize: 20),
              ),
              subtitle: Text(widget.slots[index]['company'],
              style: TextStyle(fontSize: 15),
              ),
              
              
            ),
          );
        },
    )
    );
  }
}