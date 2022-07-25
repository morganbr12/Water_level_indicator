import 'package:flutter/material.dart';

// other import that is creating by programmer in the app.
import './screens/home_page_screen.dart';

void main(List<String> args) {
  runApp(const WaterLevelIndicator());
}

class WaterLevelIndicator extends StatelessWidget {
  const WaterLevelIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Water Level Indicator",
      home: HomePage(),
    );
  }
}
