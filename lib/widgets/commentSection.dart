
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class CommentSection extends StatelessWidget {
  int id;
  final List<String> myList;
  CommentSection(this.myList,this.id);
  @override
  Widget build(BuildContext context) {
    // return Text("hello");
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.all(8.0),
        children: myList!=null || myList[id]=="Bahadim City"? myList
            .map(
              (data) => ListTile(
                  leading: Icon(Icons.comment),
                  title: Text(DateFormat('kk:mm:ss \t EEE d MMM')
                      .format(new DateTime.now())
                      .toString()),
                  subtitle: Text(data)),
            )
            .toList() : [Text('You Haven\'t entered any input yet!')],
      ),
    );
  }
}
