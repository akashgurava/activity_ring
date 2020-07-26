import 'package:flutter/material.dart';

import 'package:activity_ring/activity_ring.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blueAccent),
                ),
                child: Ring(
                  percent: 20,
                  color: Colors.red,
                  width: 10,
                  child: Center(child: Text('Radius')),
                ),
              ),
              SizedBox(
                height: 100,
                width: 100,
                child: Ring(
                  percent: 80,
                  color: Colors.blue,
                  width: 10,
                  child: Center(child: Text('Parent')),
                  showBackground: true,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
