import 'package:flutter/material.dart';
import 'package:portal_enfermeiros/UI/Search/1-searchFilters.dart';

class MainWindow extends StatefulWidget {
  @override
  _MainWindow createState() => _MainWindow();
}

class _MainWindow extends State<MainWindow> {
  String email;
  String pwd;
  void next() {
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(builder: (context) => Login()),
    // );
  }

  Container gerateHeader(String t) {
    return Container(
      child: Text(
        t,
        style: TextStyle(color: Colors.black38, fontSize: 16),
      ),
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.all(2),
    );
  }

  Container generateBox({Widget content}) {
    return Container(
      child: Column(
        children: [
          Expanded(
            child: Container(
              child: content,
              decoration: BoxDecoration(
                  //color: Colors.deepPurple[300],
                  borderRadius: BorderRadius.all(Radius.circular(10))),
            ),
          ),
          Divider(
            color: Colors.grey,
            indent: 10,
            endIndent: 10,
            thickness: 1,
            height: 5,
          ),
          Container(
            height: 35,
            child: Center(
              child: Text(
                "Mais",
                style: TextStyle(fontSize: 16),
              ),
            ),
          )
        ],
      ),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.4),
                spreadRadius: 1,
                blurRadius: 10,
                offset: Offset(5, 5))
          ],
          // border: Border.all(
          //   color: Colors.transparent,
          // ),
          borderRadius: BorderRadius.all(Radius.circular(10))),
    );
  }

  @override
  Widget build(BuildContext context) {
    //Navigator.removeRouteBelow(context, ModalRoute.of(context));
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.search),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SearchFilter()),
          );
        },
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('[App name]'),
        centerTitle: true,
        actions: [],
      ),
      body: Container(
          margin: EdgeInsets.all(20.0),
          child: Column(
            children: [
              Expanded(
                  child: Container(
                margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
                child: Column(
                  children: [
                    gerateHeader("Conversas"),
                    Expanded(child: generateBox()),
                  ],
                ),
              )),
              //),
              Expanded(
                child: Container(
                  margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: Column(
                    children: [
                      gerateHeader("Histórico"),
                      Expanded(child: generateBox())
                    ],
                  ),
                ),
              ),
              Container(
                height: 80,
              )
            ],
          )),
    );
  }
}
