import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:kuran_01/suremodel.dart';

class DetailReadPage extends StatefulWidget {
  final String name;
  final String server;
  final String ayetSira;
  final String sureName;

  const DetailReadPage({
    required this.name,
    required this.server,
    required this.ayetSira,
    required this.sureName,
  });

  @override
  _DetailReadPageState createState() => _DetailReadPageState();
//bool isBackButtonActivated = false;
}

class _DetailReadPageState extends State<DetailReadPage> {
  AudioCache cache = new AudioCache();
  AudioPlayer audioPlayer = new AudioPlayer();
  Duration duration = new Duration();
  Duration position = new Duration();
  IconData playBtn = Icons.play_arrow;
  bool playing = false;
  var counter;
  var personalResult;
  bool yukleniyor = false;

  late String urlayet;

  Widget slider() {
    return Container(
      color: Colors.green[300],
      width: 300.0,
      height: 50,
      child: Slider.adaptive(
          activeColor: Colors.blue[700],
          inactiveColor: Colors.red[400],
          value: position.inSeconds.toDouble(),
          max: duration.inSeconds.toDouble(),
          onChanged: (value) {
            seekToSec(value.toInt());
          }),
    );
  }

  void seekToSec(int sec) {
    Duration newPos = Duration(seconds: sec);
    audioPlayer.seek(newPos);
  }

//http://server9.mp3quran.net/zahrani/003.mp3
//http://server9.mp3quran.net/zahrani/003.mp3
  void vaazCal() async {
    final url = widget.server + '/' + widget.ayetSira + '.mp3';
    print(url);
    if (playing) {
      var res = await audioPlayer.pause();
      if (res == 1) {
        setState(() {
          playing = false;
        });
      }
    } else {
      var res = await audioPlayer.play(url);
      if (res == 1) {
        setState(() {
          playing = true;
        });
      }
    }
  }

  @override
  void initState() {
    audioPlayer = AudioPlayer();
    cache = AudioCache(fixedPlayer: audioPlayer);

    // ignore: deprecated_member_use
    audioPlayer.durationHandler = (d) {
      setState(() {
        duration = d;
      });
    };

    // ignore: deprecated_member_use
    audioPlayer.positionHandler = (p) {
      setState(() {
        position = p;
      });
    };
  }

  Future<bool> _onBackPressed() async {
    final shouldPop = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Are you sure?',
            style: TextStyle(fontSize: 25.0, color: Colors.black),
          ),
          content: Text('You are going to exit'),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // ignore: deprecated_member_use
                FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                  child: Text('Hayir',
                      style: TextStyle(fontSize: 25.0, color: Colors.black)),
                ),
                // ignore: deprecated_member_use
                FlatButton(
                  focusColor: Colors.green,
                  onPressed: () async {
                    Navigator.of(context).pop(true);
                  },
                  child: Text('Evet',
                      style: TextStyle(fontSize: 25.0, color: Colors.black)),
                ),
              ],
            ),
          ],
        );
      },
    );
    return shouldPop ?? false;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    vaazCal();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: AnimatedTextKit(
          animatedTexts: [
            TypewriterAnimatedText(
              widget.name,
              textStyle: const TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
              speed: const Duration(milliseconds: 500),
            ),
          ],
          totalRepeatCount: 4,
          pause: const Duration(milliseconds: 1000),
          displayFullTextOnTap: true,
          stopPauseOnTap: true,
        ),
        leading: IconButton(
          onPressed: () {
            setState(() async {
              Navigator.of(context).pop();
            });
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      //let's start by creating the main UI of the app
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.centerRight,
              end: Alignment.centerLeft,
              colors: [
                Theme.of(context).backgroundColor,
                Theme.of(context).scaffoldBackgroundColor
              ],
              tileMode: TileMode.mirror),
        ),
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Let's add some text title
              Expanded(
                flex: 2,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.sureName,
                        style: TextStyle(
                          fontSize: 25,
                        ),
                      ),
                      Container(
                        height: 700,
                        color: Colors.yellow,
                        child: FutureBuilder(
                          future: callKuran(),
                          builder:
                              (BuildContext context, AsyncSnapshot snapshot) {
                            if (snapshot.hasData) {
                              return ListView.builder(
                                itemCount: counter,
                                itemBuilder: (BuildContext context, int index) {
                                  return Card(
                                    child: ListTile(
                                      title: Text(
                                        personalResult.data.verses[index].verse,
                                        style: TextStyle(
                                            fontSize: 35, fontFamily: 'Latif'),
                                      ),
                                      subtitle: Text(
                                        personalResult.data.verses[index]
                                                .transcription +
                                            '\n\nMeal:\n' +
                                            personalResult.data.verses[index]
                                                .translation.text,
                                      ),
                                      leading: CircleAvatar(
                                        child: Text(personalResult
                                            .data.verses[index].verseNumber
                                            .toString()),
                                      ),
                                    ),
                                  );
                                },
                              );
                            }
                            return Center(child: CircularProgressIndicator());
                          },
                        ),
                      ),
                      Center(
                        child: Text(
                          widget.sureName,
                          overflow: TextOverflow.visible,
                          style: TextStyle(fontSize: 25.0),
                          textAlign: TextAlign.center,
                          textWidthBasis: TextWidthBasis.parent,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Expanded(
                flex: 1,
                child: Container(
                  // constraints: BoxConstraints.tightForFinite(width: 500),
                  //padding: EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //Let's start by adding the controller
                      //let's add the time indicator text
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        color: Colors.green[300],
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "${duration.inMinutes}:${duration.inSeconds.remainder(60)}",
                              style: TextStyle(
                                fontSize: 15.0,
                              ),
                            ),
                            slider(),
                            Text(
                              "${position.inMinutes}:${position.inSeconds.remainder(60)}",
                              style: TextStyle(
                                fontSize: 15.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            IconButton(
                              iconSize: 100.0,
                              color: Colors.blue[800],
                              onPressed: () {
                                //here we will add the functionality of the play button
                                setState(() {
                                  vaazCal();
                                });
                              },
                              icon: Icon(
                                playing == false
                                    ? Icons.play_circle_outline
                                    : Icons.pause_circle_outline,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future callKuran() async {
    var url = Uri.parse('https://api.acikkuran.com/surah/${widget.ayetSira}');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        //
        var gelen = kuranFromJson(response.body);
        // print(gelen.data.audio.mp3);
        //  print(gelen.data.verses[0].verse);
        //  print(gelen.data.verses[0].id.toString());
        //print(gelen.data.verseCount.toString());

        //
        if (mounted)
          setState(() {
            counter = gelen.data.verseCount;
            personalResult = gelen;
            yukleniyor = true;
          });
        return gelen;
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
