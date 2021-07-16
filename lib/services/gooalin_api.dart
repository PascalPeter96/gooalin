import 'dart:convert';

import 'package:gooalin/models/live_fixture.dart';
import 'package:http/http.dart' as http;


const baseUrl = 'https://v3.football.api-sports.io/fixtures?live=all';
class GoalApi {

  static const headers = {
    'x-rapidapi-key': '26f84a903d57bea88b3a9d0bd66c6f72',
    'x-rapidapi-host': 'v3.football.api-sports.io'
  };

// static Future<List<LiveFixture>?> getLiveFixtures() async{
//   http.Response liveUrl = await http.get(Uri.parse(baseUrl), headers: headers);
//   if(liveUrl.statusCode==200){
//     Iterable liveString = json.decode(liveUrl.body)['response']['fixture'];
//     print(liveString);
//     return liveString.map((e) => LiveFixture.fromJson(e)).toList();
//   }else
//     return null;
// }

}