import 'package:flutter/material.dart';
import 'package:untitled/list_provider.dart';
import 'main2.dart';
import 'package:provider/provider.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=>Numbers())
      ],
      child: MaterialApp(
        home: ProviderPage(),
      ),
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
      print(integers);
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
        actions: [
          IconButton(onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => prov(integers)),
            );
          },


            icon:
          Icon(Icons.forward),

          )
        ],
      ),
      body: Container(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Expanded(
                child: Container(
                  height: 600,
                  width: 600,
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
