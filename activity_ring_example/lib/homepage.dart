import 'dart:math';

import 'package:flutter/material.dart';

import 'package:activity_ring/activity_ring.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
                percent: 300,
                ringTemplate: RingColorTemplate.red,
                child: Center(
                  child: MaterialButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Yellow'),
                  ),
                ),
              ),
            ),
            Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.redAccent),
              ),
              child: Ring(
                percent: Random().nextInt(100).toDouble(),
                ringTemplate: RingColorTemplate.red,
                child: Center(
                  child: MaterialButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('blue'),
                  ),
                ),
              ),
            ),
            Container(
              height: 100,
              width: 80,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.yellowAccent),
              ),
              child: Ring(
                percent: Random().nextInt(100).toDouble(),
                ringTemplate: RingColorTemplate.red,
                child: Center(
                  child: MaterialButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('red'),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
