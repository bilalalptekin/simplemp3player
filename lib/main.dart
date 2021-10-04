import 'package:flutter/material.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

void main() {
  runApp(Musicplayer());
}

class Musicplayer extends StatefulWidget {
  Musicplayer({Key? key}) : super(key: key);

  @override
  _MusicplayerState createState() => _MusicplayerState();
}

class _MusicplayerState extends State<Musicplayer> {
  bool playpausebtn = true;
  IconData iconu = Icons.pause;
  final _player = AssetsAudioPlayer();
  //var sngduration;

  //var position = AssetsAudioPlayer().currentPosition;
  //Duration musicLength = new Duration();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.pink,
        body: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: 120,
              ),
              streamBuilder(), //slider(_player),
              Container(
                //decoration: BoxDecoration(image:DecorationImage(image: AssetImage('assets/images/mainscreen.png')),color: Colors.blue,borderRadius: BorderRadius.circular(15)),

                //margin: EdgeInsets.all(20),
                padding: EdgeInsets.fromLTRB(190 , 20, 190, 20),
              ),
              Container(
                color: Colors.black,
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.arrow_back_ios,
                          size: 75,
                          color: Colors.amberAccent,
                        ),
                        padding: EdgeInsets.fromLTRB(95, 10, 0, 60)),
                    IconButton(
                        onPressed: () {
                          {
                            _player.playOrPause();
                            setState(() {
                              if (playpausebtn) {                                iconu = Icons.play_arrow;
                                playpausebtn = false;
                              } else if (playpausebtn == false) {
                                iconu = Icons.pause;
                                playpausebtn = true;
                              }
                            });
                          }
                        },
                        icon: Icon(
                          iconu,
                          size: 75,
                          color: Colors.amberAccent,
                        ),
                        padding: EdgeInsets.fromLTRB(45, 10, 65, 60)),
                    // IconButton(onPressed:(){{

                    //   print("çalıştı");
                    // } }, icon: Icon(Icons.pause,size: 75,color: Colors.amberAccent,),padding: EdgeInsets.fromLTRB(45, 10, 65, 60)),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.arrow_forward_ios,
                          size: 75,
                          color: Colors.amberAccent,
                        ),
                        padding: EdgeInsets.fromLTRB(0, 10, 100, 60)),
                  ],
                ),
              ),
              SizedBox(height: 15,),
              SizedBox(
                // Vertical ListView
                height: 450,
                width: 400,
                child: ListView(
                  
                 children:<Widget>[
                   SizedBox(height: 15,),
                      buildRaisedButton(
                  "Vacuum Cleaner", "sounds/vacuum2.mp3", _player),
              SizedBox(
                height: 15,
              ),
              buildRaisedButton("Waterfall", "sounds/waterfall.mp3", _player),
              SizedBox(
                height: 15,
              ),
              buildRaisedButton("Çeviri", "", _player),
              SizedBox(
                height: 15,
              ),
              buildRaisedButton("İşaret Dili", "", _player),
              SizedBox(
                height: 15,
              ),
 buildRaisedButton("İşaret Dili", "", _player),
              SizedBox(
                height: 15,
              ), buildRaisedButton("İşaret Dili", "", _player),
              SizedBox(
                height: 15,
              ), buildRaisedButton("İşaret Dili", "", _player),
              SizedBox(
                height: 15,
              ), buildRaisedButton("İşaret Dili", "", _player),
              SizedBox(
                height: 15,
              ), buildRaisedButton("İşaret Dili", "", _player),
              SizedBox(
                height: 15,
              ), buildRaisedButton("İşaret Dili", "", _player),
              SizedBox(
                height: 15,
              ),
              
                 ]
                ),
              ),
              // ListView.builder(
              //   itemCount: 4,
              //   itemBuilder: (BuildContext context, int index) {
              //   return new Card(
              //       color: Colors.blue[index * 100],
              //       child: new Container(
              //         width: 50.0,
              //         height: 50.0,
              //         child: new Text("bilo"),
              //       ),);
              //  },
              // ),
            ],
          ),
        ),
      ),
    );
  }
  //   Widget slider(AssetsAudioPlayer player) {
  //   return Container(
  //     width: 300.0,
  //     child: Slider.adaptive(
  //         activeColor: Colors.black,
  //         inactiveColor: Colors.amber,
  //         value: double(position),
  //         min: 0.0,
  //         max: musicLength.inSeconds.toDouble(),

  //         onChanged: (double value) {
  //           setState(() {
  //             value=value;
  //             changeToSecond(value.toInt(),player);

  //           });

  //         }),
  //   );
  // }
  StreamBuilder streamBuilder() {
    return StreamBuilder(
        stream: _player.currentPosition,
        builder: (context, asyncSnapshot) {
          final Duration currentduration = asyncSnapshot.data;
          //final Duration duration=;
          return Text(
            currentduration.toString().substring(2, 7) + "/" + "10:00",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          );
        });
  }
  // void changeToSecond(int second,AssetsAudioPlayer player)
  // {
  //     Duration newDuration=Duration(seconds: second);
  //     player.seek(newDuration);

  //   }

  Widget buildRaisedButton(String text, String musicpath,
      AssetsAudioPlayer player) //,Duration mscDuration)
  {
    return RaisedButton(
      //color: Colors.black,
      onPressed: () {
        player.open(Audio(musicpath), showNotification: true);
        //PlayingAudio playing = player.current.value as PlayingAudio;

        //final asset = playing.audio;

        // print(playing);
        setState(() {
          //var songDuration = playing.duration;
          //sngduration=songDuration;
          iconu = Icons.pause;
          playpausebtn = true;
        });

        //print("çalıştı");
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      padding: EdgeInsets.fromLTRB(0, 0,0, 0),
      child: Ink(
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xff374ABE), Color(0xff64B6FF)],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
            borderRadius: BorderRadius.circular(15)),
        child: Container(
          constraints: BoxConstraints(maxWidth: 450.0, minHeight: 70.0),
          alignment: Alignment.center,
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 30),
          ),
        ),
      ),
    );
  }
}
