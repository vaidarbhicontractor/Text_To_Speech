import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final FlutterTts flutterTts = FlutterTts();

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();

    _speak(String text) async {
      print(await flutterTts.getLanguages);
      await flutterTts.setLanguage('en-us');
      await flutterTts.setPitch(1);
      await flutterTts.speak(text);
    }

    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Center(
                child: TextFormField(
                  decoration: InputDecoration(
                      hintText: 'Enter something to speak',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            width: 2,
                            color: Colors.green,
                          ))),
                  controller: controller,
                ),
              ),
            ),
            RaisedButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
                side: BorderSide(width: 2, color: Colors.pink),
              ),
              child: Text("Press this to speak something"),
              onPressed: () => _speak(controller.text),
              padding: EdgeInsets.all(8),
              color: Colors.red,
            )
          ],
        ),
      ),
    );
  }
}
