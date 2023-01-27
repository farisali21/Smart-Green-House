import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:http/http.dart' as http;

class GetData {
  List<dynamic> funToReturnList(List? data) {
    Future<List> fetchAlbum() async {
      List listOfData = [];
      final response = await http.get(Uri.parse(
          'https://greenhouse-bcd96-default-rtdb.firebaseio.com/.json'));

      if (response.statusCode == 200) {
        // If the server did return a 200 OK response,
        // then parse the JSON.
        Map<String, dynamic> map = json.decode(response.body);
        map.forEach((key, value) {
          listOfData.add(value);
        });
        return listOfData;
      } else {
        // If the server did not return a 200 OK response,
        // then throw an exception.
        throw Exception('Failed to load album');
      }
    }

    return data!;
  }
}

class AutoGenerate {
  AutoGenerate({
    required this.id1,
  });
  late final id1;

  AutoGenerate.fromJson(Map<String, dynamic> json) {
    id1 = id1.fromJson(json['-NJjilGt_NMgMIB7dS-F']);
  }
}

class id1 {
  id1({
    required this.AirQuality,
    required this.Brightness,
    required this.Humidity,
    required this.Moisture,
    required this.Tempreture,
    required this.TimeStamp,
  });
  late final double AirQuality;
  late final int Brightness;
  late final int Humidity;
  late final int Moisture;
  late final int Tempreture;
  late final String TimeStamp;

  id1.fromJson(Map<String, dynamic> json) {
    AirQuality = json['AirQuality'];
    Brightness = json['Brightness'];
    Humidity = json['Humidity'];
    Moisture = json['Moisture'];
    Tempreture = json['Tempreture'];
    TimeStamp = json['TimeStamp'];
  }
}
