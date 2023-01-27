import 'package:dashboard_gh/service/get_data.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

import 'dashboard.dart';


class TestApi extends StatelessWidget {
  List listOfData = [];

  Future<void> readData() async{

    DatabaseReference starCountRef = FirebaseDatabase.instance.ref();
    starCountRef.onValue.listen((DatabaseEvent event) {
      final data = event.snapshot.value as Map;
      data.forEach((key, value) {
        listOfData.add(value);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 50),
          Center(
            child: ElevatedButton(onPressed: (){
              readData();
            }, child: Text("getdata")),
          ),
          Center(
            child: ElevatedButton(onPressed: (){
              print(listOfData);
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => MenuDashboardPage()));
            }, child: Text("click")),
          ),
        ],
      ),
    );
  }

}
