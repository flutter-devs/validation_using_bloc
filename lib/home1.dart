import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home1 extends StatefulWidget {

  @override
  State<Home1> createState() => _Home1State();
}

class _Home1State extends State<Home1> {
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
    body: Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 30, left: 20),
          child: Align(
            alignment: Alignment.topLeft,
            child: IconButton(onPressed: (){
              Navigator.pop(context);
            },
                icon: const Icon(Icons.arrow_back_ios)),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 320),
          child: Center(child: Text('WELCOME TO HOME...',
          style: TextStyle(
            color: Colors.teal,
            fontSize: 30,
            fontWeight: FontWeight.bold
          ),)),
        ),
      ],
    ),
    );
  }
}
