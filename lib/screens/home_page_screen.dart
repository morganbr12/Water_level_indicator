import 'package:flutter/material.dart';
import '../widgets/body_widget.dart';

enum Status {
  Pumping,
  TurnedOff,
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late bool isTurnOn = false;

  void isChanged(value) {
    setState(() {
      isTurnOn = value;

      if (isTurnOn == true) {
        Status.Pumping;
      } else {
        Status.TurnedOff;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    const title = Text(
      "Water Level Indicator",
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 23,
      ),
    );
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      appBar: AppBar(
        title: title,
        centerTitle: true,
        backgroundColor: Colors.black,
        elevation: 2,
        titleTextStyle: const TextStyle(
          color: Colors.white,
        ),
      ),
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      "Pump Status: ",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      '$isTurnOn',
                      style: const TextStyle(
                        fontSize: 23,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Text(
                      "Tank Level: ",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      'Fillings',
                      style: TextStyle(
                        fontSize: 23,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 150,
                  height: size.width * 0.8,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const NewBodyWidget(),
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Text(
                      "Water Temperature",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "32 °C",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    )
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              "Manual Switch",
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(
              height: 100,
              width: 150,
              child: FittedBox(
                fit: BoxFit.fill,
                child: Switch(
                  value: isTurnOn,
                  onChanged: (value) {
                    isChanged(value);
                  },
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
