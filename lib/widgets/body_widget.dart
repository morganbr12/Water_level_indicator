import 'package:flutter/material.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';

class NewBodyWidget extends StatefulWidget {
  const NewBodyWidget({Key? key}) : super(key: key);

  @override
  State<NewBodyWidget> createState() => _NewBodyWidgetState();
}

class _NewBodyWidgetState extends State<NewBodyWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    // TODO: implement initState

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(minutes: 2),
    );

    animationController.addListener(() {
      setState(() {
        // actions here
      });
    });
    animationController.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final percentage = animationController.value * 100;
    return LiquidLinearProgressIndicator(
      value: animationController.value,
      valueColor: const AlwaysStoppedAnimation(Colors.blueAccent),
      center: Text(
        '${percentage.toStringAsFixed(0)}%',
        style: const TextStyle(
          fontSize: 23,
          fontWeight: FontWeight.bold,
          color: Colors.pink,
        ),
      ),
      backgroundColor: Colors.grey,
      direction: Axis.vertical,
      borderRadius: 20,
    );
  }
}
