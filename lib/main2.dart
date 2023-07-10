import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/list_provider.dart';
import 'main2.dart';
class prov extends StatefulWidget {
 // late List myIntegers;
//prov(this.myIntegers);
  @override
  State<prov> createState() => _provState();
}

class _provState extends State<prov> {
  /*
  int increment = 0;

  void callBack() {
    setState(() {
      if (increment >= 10) {
        widget.myIntegers.clear();
        increment = 0;
      } else {
        increment++;
        widget.myIntegers.add(increment);
        print(widget.myIntegers);
      }
    });
  }


*/
  @override
  Widget build(BuildContext context) {
    return Consumer<Numbers>(
        builder:(context,numbersProviderModel,child)=> Scaffold(
        appBar: AppBar(


          title: Center(
            child: Text(
              numbersProviderModel.integers.isNotEmpty ? numbersProviderModel.integers.last.toString() : "",
            ),
          ),


          backgroundColor: Colors.orangeAccent,
          leading:IconButton(
            onPressed:
            (){
              Navigator.pop(context);
            }
            ,
            icon:Icon(Icons.directions) ,
          ) ,

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
                      itemCount:  numbersProviderModel.integers.length,
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
