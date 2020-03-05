//import 'dart:developer';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_share/flutter_share.dart';


//import 'package:ads/ads.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: MyHomePage(title: 'SpeakTamil With Sasiccio'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  AudioCache _audioCache;
  List<String> suoniSasiccio = List();
  bool isSwitched = true;
  final _scaffoldKey = GlobalKey<ScaffoldState>(); // new line

  @override
  void initState() {
    super.initState();
    // create this only once

    _audioCache = AudioCache(
        fixedPlayer: AudioPlayer()..setReleaseMode(ReleaseMode.RELEASE));

//List of Sounds
    suoniSasiccio.add("sounds/hotta.mp3");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text(widget.title),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.wb_sunny),
              tooltip: 'Napoli Edition',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SecondRoute()),
                );
              },
            ),
          ],
        ),
        body: GridView.count(
            // Create a grid with 2 columns. If you change the scrollDirection to
            // horizontal, this produces 2 rows.
            crossAxisCount: 2,
            // Generate 100 widgets that display their index in the List.

            children: <Widget>[
              Container(
                  padding: const EdgeInsets.all(8),
                  child: FlatButton(
                 /*   onPressed: () {
                      if (isSwitched) {
                        _audioCache.play("sounds/kundapaya.mp3");
                      } else {
                        _audioCache.loop("sounds/kundapaya.mp3");
                      }
                    },*/
                    onPressed: (){ _audioCache.play("sounds/kundapaya.mp3");},
                    child: 
                    
                    Image(
                      image: AssetImage('assets/images/csk.png'),
                    ),
                  )),
              Container(
                  padding: const EdgeInsets.all(8),
                  child: FlatButton(
                      onPressed: () {
                        return _audioCache.play("sounds/cinnasutu.mp3");
                      },
                      child: Column(
                        children: <Widget>[
                          Image(image: AssetImage('assets/images/csk.png')),
                          Text(
                            'Cinna Sutu',
                            style: GoogleFonts.aBeeZee(
                              textStyle: TextStyle(
                                  color: Colors.red, letterSpacing: .5),
                            ),
                          )
                        ],
                      ))),
              Container(
                  padding: const EdgeInsets.all(8),
                  child: FlatButton(
                      onPressed: () {
                        return _audioCache.play("sounds/periemole.mp3");
                      },
                      child: Column(
                        children: <Widget>[
                          Image(image: AssetImage('assets/images/csk.png')),
                          Text(
                            'Perie Molè',
                            style: GoogleFonts.aBeeZee(
                              textStyle: TextStyle(
                                  color: Colors.red, letterSpacing: .5),
                            ),
                          )
                        ],
                      ))),
              Container(
                padding: const EdgeInsets.all(8),
                child: FlatButton(
                    //    onPressed: () => _audioCache.play("sounds/hotta.mp3"),
                    onPressed: () =>
                        _soundandwrite(context, suoniSasiccio[0], "ஜ"),
                    child: Image.asset('assets/images/csk.png')),
              ),
              Container(
                child: //this goes in as one of the children in our column
                    Switch(
                  value: isSwitched,
                  onChanged: (value) {
                    setState(() {
                      isSwitched = value;
                    });
                  },
                  activeTrackColor: Colors.lightGreenAccent,
                  activeColor: Colors.green,
                ),
              ),

              /*Container(
                child: RaisedButton(
                  textColor: Colors.black,
                  onPressed: () => _displaySnackBar(context),
                  child: Text('New Phrases Coming Soon'),
                ),
              )*/
            ]));
  }

  _soundandwrite(BuildContext context, String _ad2, String parola) {
    final snackBar = SnackBar(
        content: Text(parola),
        backgroundColor: Color.fromARGB(255, 255, 0, 0),
        duration: Duration(seconds: 5));
    _scaffoldKey.currentState.showSnackBar(snackBar);

    _audioCache.play(_ad2);

    return (context);
  }

//it opens a SnackBar and Plays a Sound

}

class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AudioCache _audioCache2;
    _audioCache2 = AudioCache(
        fixedPlayer: AudioPlayer()..setReleaseMode(ReleaseMode.RELEASE));
    AudioPlayer.logEnabled = true;
    return Scaffold(
        appBar: AppBar(
          title: Text("Napoli Edition"),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.wb_sunny),
              tooltip: 'Napoli Edition',
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
        body: GridView.count(
            // Create a grid with 2 columns. If you change the scrollDirection to
            // horizontal, this produces 2 rows.
            crossAxisCount: 2,
            // Generate 100 widgets that display their index in the List.

            children: <Widget>[
              Container(
                  padding: const EdgeInsets.all(8),
                  child: FlatButton(
                    onPressed: () => _audioCache2.play("sounds/bem.mp3"),
                    child: Image(
                      image: AssetImage('assets/images/napoli.png'),
                    ),
                  )),
              Container(
                  padding: const EdgeInsets.all(8),
                  child: FlatButton(
                    onPressed: () => _audioCache2.play("sounds/strunz.mp3"),
                    child: Image(image: AssetImage('assets/images/napoli.png')),
                  )),
              Container(
                  padding: const EdgeInsets.all(8),
                  child: FlatButton(
                    onPressed: () => _audioCache2.play("sounds/kitemurt.mp3"),
                    child: Image(image: AssetImage('assets/images/napoli.png')),
                  )),
              Container(
                padding: const EdgeInsets.all(8),
                child: FlatButton(
                    onPressed: () => _audioCache2.play("sounds/sfacimm.mp3"),
                    child: Image.asset('assets/images/napoli.png')),
              ),
            ]));
  }
}
