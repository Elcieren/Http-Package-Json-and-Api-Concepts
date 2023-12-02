import 'package:flutter/material.dart';

import 'local_json.dart';
import 'remote_api.dart';

void main(){
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyhomePage(),
    );
  }
}

class MyhomePage extends StatelessWidget {
  const MyhomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('http Json'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder:(context)=>const LocalJson()));
              }, child: const Text('Local Json')),
              ElevatedButton(onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const RometeApi()));
              }, child: Text('Remote Api'))
          ],
        ),
        ),
    );
  }
}