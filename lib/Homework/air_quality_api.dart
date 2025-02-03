import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AirQualityApi extends StatefulWidget {
  const AirQualityApi({super.key});

  @override
  State<AirQualityApi> createState() => _AirQualityApiState();
}

class _AirQualityApiState extends State<AirQualityApi> {
  Map<String, dynamic> info = {};

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      var response = await http
          .get(Uri.parse('https://api.waqi.info/feed/here/?token=8666581f103283e608cf9b2c41e79c4cefd94c9e&fbclid=IwY2xjawIKzv5leHRuA2FlbQIxMAABHS5Zz8KM2DIdG5NIbCziR3ybYlhq6tGiaJ_jlM2x7Cd9fNG1BkFtQz40lg_aem_zMUzcSnnbOJW0JmX5yrwbg'));
      if (response.statusCode == 200) {
        setState(() {
          info = jsonDecode(response.body);
          print(info);
        });
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
      appBar: AppBar(title: Text('Air Quality Index (AQI)'),
      backgroundColor: const Color.fromARGB(255, 199, 20, 20),
      titleTextStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w700,),
                        ),
      body: Center(
        child: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            children: [
              Text("${info['data']['city']['name']}", 
                style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20,),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 150,
                decoration: BoxDecoration(color: const Color.fromARGB(255, 255, 184, 184),
                            borderRadius: BorderRadius.circular(10)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("${info['data']['iaqi']['pm25']['v']}",
                    style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.w900,
                    ),
                  ),
                  Text('${getAqiScale(info['data']['iaqi']['pm25']['v'])}',
                    style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w900,
                    ),),
                  ],
                ),
              ),
              SizedBox(height: 15,),
              Text("Temperature ${info['data']['iaqi']['t']['v']}\t ํc",
                style: TextStyle(
                      fontSize: 16,
                ),),
              SizedBox(height: 20,),
              ElevatedButton(onPressed: (){
                  fetchData();
              }, child: Text('Refresh',style: TextStyle(color: const Color.fromRGBO(0, 0, 0, 1)),),
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 210, 255, 159),
                  padding: EdgeInsets.all(20),
              ),)
            ],
          )
        ),
      )
    );
  }

  String getAqiScale(int aqi) {
    if(aqi <= 50) {
      return "Good";
    } else if(aqi <= 100){
      return "Moderate";
    }
    else if(aqi <= 150){
      return "Unhealthy for Sensitive Groups";
    }
    else if(aqi <= 200){
      return "Unhealthy";
    }
    else if(aqi <= 300){
      return "Very Unhealthy";
    } else {
      return "Hazardous";
    }
  }
}