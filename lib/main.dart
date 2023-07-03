import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProviderPage(),
    );
  }
}

class ProviderPage extends StatefulWidget {
  @override
  State<ProviderPage> createState() => _ProviderPageState();
}

class _ProviderPageState extends State<ProviderPage> {
  late String displayText;
  int increment = 0;
  List<int> integers = [];

  void callBack() {
    setState(() {
      if (increment >= 10) {
       integers.clear();
        increment = 0;
      } else {
        increment++;
       integers.add(increment);

      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        title: Center(
          child: Text(
            integers.isNotEmpty ? integers.last.toString() : "",
          ),
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                height: 50,
                width: 50,
                child: ListView.builder(
                  itemCount: integers.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                        integers[index].toString(),
                      ),
                    );
                  },
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: GestureDetector(
                onTap: () {
                  callBack();
                },
                child: Icon(Icons.add, size: 50),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
