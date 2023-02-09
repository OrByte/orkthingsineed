import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shared Preferences Example',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _savedData = "";

  @override
  void initState() {
    super.initState();
    _loadSavedData();
  }

  _loadSavedData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      _savedData = preferences.getString("data") ?? "";
    });
  }

  _saveData(String data) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("data", data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shared Preferences Example'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                hintText: 'Enter data to save',
              ),
              onSubmitted: (value) {
                _saveData(value);
                _loadSavedData();
              },
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              'Saved Data: $_savedData',
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
