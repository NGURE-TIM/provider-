import 'package:flutter/material.dart';
import 'package:untitled/list_provider.dart';
import 'main2.dart';
import 'package:provider/provider.dart';
void main() => runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context)=>Numbers())
    ],
    child: MyApp()));

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
//  late String displayText;
/*
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
*/
  @override
  Widget build(BuildContext context) {
    return Consumer<Numbers>(
     builder:(context,numbersProviderModel,child)=> Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orangeAccent,
          title: Center(
            child: Text(
              numbersProviderModel.integers.isNotEmpty ? numbersProviderModel.integers.last.toString() : "",
            ),
          ),
          actions: [
            IconButton(onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => prov()),
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
                      itemCount: numbersProviderModel.integers.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(
                            numbersProviderModel.integers[index].toString(),
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
                    numbersProviderModel.callBack();
                  },
                  child: Icon(Icons.add, size: 50),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
