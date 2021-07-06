import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:kuran_01/reciterModel.dart';
import 'package:kuran_01/reciter_page.dart';

class DetailHocalar extends StatefulWidget {
  const DetailHocalar({Key? key}) : super(key: key);

  @override
  _DetailHocalarState createState() => _DetailHocalarState();
}

class _DetailHocalarState extends State<DetailHocalar> {
  var Result;
  var counter;

  final url = Uri.parse('http://mp3quran.net/api/_english.json');

  Future fetchAyet() async {
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        //
        //     final reciters = recitersFromJson(jsonString);
        var gelen = recitersFromJson(response.body);
        print(gelen.reciters[1].id);
        print(gelen.reciters[1].name);
        //
        if (mounted)
          setState(() {
            counter = gelen.reciters.length;
            Result = gelen;
          });
        return gelen;
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchAyet();
  }

  @override
  Widget build(BuildContext context) {
    // fetchAyet();
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Page Hocalar '),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(8),
          child: counter != null
              ? ListView.builder(
                  itemCount: counter,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      splashColor: Colors.yellow,
                      highlightColor: Colors.green,
                      focusColor: Colors.red,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ReciterPage(
                              name: Result.reciters[index].name,
                              id: Result.reciters[index].id,
                              server: Result.reciters[index].server,
                            ),
                          ),
                        );
                      },
                      child: Card(
                        color: Colors.orange[200],
                        child: ListTile(
                          trailing: Icon(Icons.arrow_forward),
                          leading: Text(Result.reciters[index].letter),
                          title: Text('${Result.reciters[index].name}' +
                              '\n' +
                              'Okudugu ayet sayisi: '
                                  '${Result.reciters[index].count}'),
                        ),
                      ),
                    );
                  },
                )
              : Center(child: CircularProgressIndicator()),
        ),
      ),
    );
  }
}
