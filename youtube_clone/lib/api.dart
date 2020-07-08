import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:youtube_clone/model/Video.dart';

const key_api = "AIzaSyDT99uiJOrJIhMtnKo3iNKpppjZRpyXBV0";
const id_canal = "UCfsOfLvadg89Bx8Sv_6WERg";
const url_base = "https://www.googleapis.com/youtube/v3/";

class Api {
  Future<List<Video>> pesquisar(String pesquisa) async {
    http.Response response = await http.get(url_base +
        "search"
            "?part=snippet"
            "&type=video"
            "&maxResults=20"
            "&order=date"
            "&key=$key_api"
            //"&channelId=$id_canal"
            "&q=$pesquisa");
    if (response.statusCode == 200) {
      Map<String, dynamic> dadosJson = json.decode(response.body);
      List<Video> videos = dadosJson["items"].map<Video>((map) {
        //return Video.converterJson(map);
        return Video.fromJson(map);
      }).toList();
      return videos;
      /*for (var video in videos) {
        print("resultados " + video.titulo);
      }*/

      /*for (var video in dadosJson["items"]) {
        print("resultado" + video.toString());
      }*/
      //print("resultado" + dadosJson["items"].toString());
    } else {}
  }
}
