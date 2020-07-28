import 'package:activity_ring/activity_ring.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart' show CupertinoThemeData;

import 'package:activity_ring_example/constants.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const ExampleApp());
}

/// Example widget to show Ring widget
class RingExample extends StatelessWidget {
  // ignore: public_member_api_docs
  const RingExample({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const Divider(height: 50),
        const Text('One Ring. percent = $firstRingPercent'),
        const Divider(
          height: 100,
          color: Colors.transparent,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Ring(
              percent: 190,
              color: RingColorScheme(ringGradients: [
                [Colors.red, Colors.yellow],
                [Colors.yellow, Colors.green]
              ]),
              radius: 80,
              width: 10,
              child: Center(child: Text('190%')),
            ),
            // Ring(
            //   percent: firstRingPercent,
            //   color: ringGradients,
            //   radius: ringRadius,
            //   width: width,
            //   child: gradientsChild,
            // ),
            //   Ring(
            //     percent: firstRingPercent,
            //     color: ringColors,
            //     radius: ringRadius,
            //     width: width,
            //     child: colorsChild,
            //   ),
            //   Ring(
            //     percent: firstRingPercent,
            //     color: ringGradient,
            //     radius: ringRadius,
            //     width: width,
            //     child: gradientChild,
            //   ),
            //   Ring(
            //     percent: firstRingPercent,
            //     color: ringColor,
            //     radius: ringRadius,
            //     width: width,
            //     child: colorChild,
            //   ),
          ],
        ),
        // const Divider(height: 80),
        // const Text('2 Rings. percent = $secondRingPercent'),
        // const Divider(height: 50),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceAround,
        //   children: <Widget>[
        //     Ring(
        //       percent: secondRingPercent,
        //       color: ringGradients,
        //       radius: ringRadius,
        //       width: width,
        //       child: gradientsChild,
        //     ),
        //     Ring(
        //       percent: secondRingPercent,
        //       color: ringColors,
        //       radius: ringRadius,
        //       width: width,
        //       child: colorsChild,
        //     ),
        //     Ring(
        //       percent: secondRingPercent,
        //       color: ringGradient,
        //       radius: ringRadius,
        //       width: width,
        //       child: gradientChild,
        //     ),
        //     Ring(
        //       percent: secondRingPercent,
        //       color: ringColor,
        //       radius: ringRadius,
        //       width: width,
        //       child: colorChild,
        //     ),
        //   ],
        // ),
      ],
    );
  }
}

/// Main Application.
class ExampleApp extends StatelessWidget {
  // ignore: public_member_api_docs
  const ExampleApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bajat',
      theme: ThemeData(
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        cupertinoOverrideTheme: const CupertinoThemeData(
          brightness: Brightness.dark,
        ),
      ),
      themeMode: ThemeMode.dark,
      // Use this instead of home so that we get the modal effect
      // for home screen
      // onGenerateRoute: router,
      home: const Scaffold(
        body: SafeArea(
          child: RingExample(),
        ),
      ),
    );
  }
}
