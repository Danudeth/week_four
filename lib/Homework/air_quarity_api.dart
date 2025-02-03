import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AirQuarityApi extends StatefulWidget {
  const AirQuarityApi({super.key});

  @override
  State<AirQuarityApi> createState() => _AirQuarityApiState();
}

class _AirQuarityApiState extends State<AirQuarityApi> {
  Future<void> fetchData() async {
    try {
      var response = await http
          .get(Uri.parse('https://api.waqi.info/feed/here/?token=8666581f103283e608cf9b2c41e79c4cefd94c9e&fbclid=IwY2xjawIKzv5leHRuA2FlbQIxMAABHS5Zz8KM2DIdG5NIbCziR3ybYlhq6tGiaJ_jlM2x7Cd9fNG1BkFtQz40lg_aem_zMUzcSnnbOJW0JmX5yrwbg'));
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        print('Name: ${data["aqi"]}');
      } else {
        print('Failed to fetch data');
      }
    } catch (e) {
      print('Error: $e');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
    );
  }
}