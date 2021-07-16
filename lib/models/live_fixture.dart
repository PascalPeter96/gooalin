// To parse this JSON data, do
//
//     final liveFixture = liveFixtureFromJson(jsonString);


// LiveFixture liveFixtureFromJson(String str) => LiveFixture.fromJson(json.decode(str));
//
// String liveFixtureToJson(LiveFixture data) => json.encode(data.toJson());

class LiveFixture {
  LiveFixture({
    this.liveFixtureGet,
    this.parameters,
    this.errors,
    this.results,
    this.paging,
    this.response,
  });

  String? liveFixtureGet;
  Parameters? parameters;
  List<dynamic>? errors;
  int? results;
  Paging? paging;
  List<Response>? response;

  factory LiveFixture.fromJson(Map<String, dynamic> json) => LiveFixture(
    liveFixtureGet: json["get"],
    parameters: Parameters.fromJson(json["parameters"]),
    errors: List<dynamic>.from(json["errors"].map((x) => x)),
    results: json["results"],
    paging: Paging.fromJson(json["paging"]),
    response: List<Response>.from(json["response"].map((x) => Response.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "get": liveFixtureGet,
    "parameters": parameters!.toJson(),
    "errors": List<dynamic>.from(errors!.map((x) => x)),
    "results": results,
    "paging": paging!.toJson(),
    "response": List<dynamic>.from(response!.map((x) => x.toJson())),
  };
}

class Paging {
  Paging({
    this.current,
    this.total,
  });

  int? current;
  int? total;

  factory Paging.fromJson(Map<String, dynamic> json) => Paging(
    current: json["current"],
    total: json["total"],
  );

  Map<String, dynamic> toJson() => {
    "current": current,
    "total": total,
  };
}

class Parameters {
  Parameters({
    this.live,
  });

  String? live;

  factory Parameters.fromJson(Map<String, dynamic> json) => Parameters(
    live: json["live"],
  );

  Map<String, dynamic> toJson() => {
    "live": live,
  };
}

class Response {
  Response({
    this.fixture,
    this.league,
    this.teams,
    this.goals,
    this.score,
    this.events,
  });

  Fixture? fixture;
  League? league;
  Goals? teams;
  Goals? goals;
  Score? score;
  List<Event>? events;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
    fixture: Fixture.fromJson(json["fixture"]),
    league: League.fromJson(json["league"]),
    teams: Goals.fromJson(json["teams"]),
    goals: Goals.fromJson(json["goals"]),
    score: Score.fromJson(json["score"]),
    events: List<Event>.from(json["events"].map((x) => Event.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "fixture": fixture!.toJson(),
    "league": league!.toJson(),
    "teams": teams!.toJson(),
    "goals": goals!.toJson(),
    "score": score!.toJson(),
    "events": List<dynamic>.from(events!.map((x) => x.toJson())),
  };
}

class Event {
  Event({
    this.time,
    this.team,
    this.player,
    this.assist,
    this.type,
    this.detail,
    this.comments,
  });

  Time? time;
  Team? team;
  Assist? player;
  Assist? assist;
  Type? type;
  Detail? detail;
  dynamic comments;

  factory Event.fromJson(Map<String, dynamic> json) => Event(
    time: Time.fromJson(json["time"]),
    team: Team.fromJson(json["team"]),
    player: Assist.fromJson(json["player"]),
    assist: Assist.fromJson(json["assist"]),
    type: typeValues.map[json["type"]],
    detail: detailValues.map[json["detail"]],
    comments: json["comments"],
  );

  Map<String, dynamic> toJson() => {
    "time": time!.toJson(),
    "team": team!.toJson(),
    "player": player!.toJson(),
    "assist": assist!.toJson(),
    "type": typeValues.reverse![type],
    "detail": detailValues.reverse![detail],
    "comments": comments,
  };
}

class Assist {
  Assist({
    this.id,
    this.name,
  });

  int? id;
  String? name;

  factory Assist.fromJson(Map<String, dynamic> json) => Assist(
    id: json["id"] == null ? null : json["id"],
    name: json["name"] == null ? null : json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "name": name == null ? null : name,
  };
}

enum Detail { NORMAL_GOAL, PENALTY }

final detailValues = EnumValues({
  "Normal Goal": Detail.NORMAL_GOAL,
  "Penalty": Detail.PENALTY
});

class Team {
  Team({
    this.id,
    this.name,
    this.logo,
    this.winner,
  });

  int? id;
  String? name;
  String? logo;
  bool? winner;

  factory Team.fromJson(Map<String, dynamic> json) => Team(
    id: json["id"],
    name: json["name"],
    logo: json["logo"],
    winner: json["winner"] == null ? null : json["winner"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "logo": logo,
    "winner": winner == null ? null : winner,
  };
}

class Time {
  Time({
    this.elapsed,
    this.extra,
  });

  int? elapsed;
  dynamic extra;

  factory Time.fromJson(Map<String, dynamic> json) => Time(
    elapsed: json["elapsed"],
    extra: json["extra"],
  );

  Map<String, dynamic> toJson() => {
    "elapsed": elapsed,
    "extra": extra,
  };
}

enum Type { GOAL }

final typeValues = EnumValues({
  "Goal": Type.GOAL
});

class Fixture {
  Fixture({
    this.id,
    this.referee,
    this.timezone,
    this.date,
    this.timestamp,
    this.periods,
    this.venue,
    this.status,
  });

  int? id;
  String? referee;
  Timezone? timezone;
  DateTime? date;
  int? timestamp;
  Periods? periods;
  Venue? venue;
  Status? status;

  factory Fixture.fromJson(Map<String, dynamic> json) => Fixture(
    id: json["id"],
    referee: json["referee"] == null ? null : json["referee"],
    timezone: timezoneValues.map[json["timezone"]],
    date: DateTime.parse(json["date"]),
    timestamp: json["timestamp"],
    periods: Periods.fromJson(json["periods"]),
    venue: Venue.fromJson(json["venue"]),
    status: Status.fromJson(json["status"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "referee": referee == null ? null : referee,
    "timezone": timezoneValues.reverse![timezone],
    "date": date!.toIso8601String(),
    "timestamp": timestamp,
    "periods": periods!.toJson(),
    "venue": venue!.toJson(),
    "status": status!.toJson(),
  };
}

class Periods {
  Periods({
    this.first,
    this.second,
  });

  int? first;
  int? second;

  factory Periods.fromJson(Map<String, dynamic> json) => Periods(
    first: json["first"],
    second: json["second"] == null ? null : json["second"],
  );

  Map<String, dynamic> toJson() => {
    "first": first,
    "second": second == null ? null : second,
  };
}

class Status {
  Status({
    this.long,
    this.short,
    this.elapsed,
  });

  Long? long;
  Short? short;
  int? elapsed;

  factory Status.fromJson(Map<String, dynamic> json) => Status(
    long: longValues.map[json["long"]],
    short: shortValues.map[json["short"]],
    elapsed: json["elapsed"],
  );

  Map<String, dynamic> toJson() => {
    "long": longValues.reverse![long],
    "short": shortValues.reverse![short],
    "elapsed": elapsed,
  };
}

enum Long { FIRST_HALF, SECOND_HALF, HALFTIME }

final longValues = EnumValues({
  "First Half": Long.FIRST_HALF,
  "Halftime": Long.HALFTIME,
  "Second Half": Long.SECOND_HALF
});

enum Short { THE_1_H, THE_2_H, HT }

final shortValues = EnumValues({
  "HT": Short.HT,
  "1H": Short.THE_1_H,
  "2H": Short.THE_2_H
});

enum Timezone { UTC }

final timezoneValues = EnumValues({
  "UTC": Timezone.UTC
});

class Venue {
  Venue({
    this.id,
    this.name,
    this.city,
  });

  int? id;
  String? name;
  String? city;

  factory Venue.fromJson(Map<String, dynamic> json) => Venue(
    id: json["id"] == null ? null : json["id"],
    name: json["name"] == null ? null : json["name"],
    city: json["city"] == null ? null : json["city"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "name": name == null ? null : name,
    "city": city == null ? null : city,
  };
}

class Goals {
  Goals({
    this.home,
    this.away,
  });

  dynamic home;
  dynamic away;

  factory Goals.fromJson(Map<String, dynamic> json) => Goals(
    home: json["home"],
    away: json["away"],
  );

  Map<String, dynamic> toJson() => {
    "home": home,
    "away": away,
  };
}

class League {
  League({
    this.id,
    this.name,
    this.country,
    this.logo,
    this.flag,
    this.season,
    this.round,
  });

  int? id;
  String? name;
  String? country;
  String? logo;
  String? flag;
  int? season;
  String? round;

  factory League.fromJson(Map<String, dynamic> json) => League(
    id: json["id"],
    name: json["name"],
    country: json["country"],
    logo: json["logo"],
    flag: json["flag"] == null ? null : json["flag"],
    season: json["season"],
    round: json["round"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "country": country,
    "logo": logo,
    "flag": flag == null ? null : flag,
    "season": season,
    "round": round,
  };
}

class Score {
  Score({
    this.halftime,
    this.fulltime,
    this.extratime,
    this.penalty,
  });

  Goals? halftime;
  Goals? fulltime;
  Goals? extratime;
  Goals? penalty;

  factory Score.fromJson(Map<String, dynamic> json) => Score(
    halftime: Goals.fromJson(json["halftime"]),
    fulltime: Goals.fromJson(json["fulltime"]),
    extratime: Goals.fromJson(json["extratime"]),
    penalty: Goals.fromJson(json["penalty"]),
  );

  Map<String, dynamic> toJson() => {
    "halftime": halftime!.toJson(),
    "fulltime": fulltime!.toJson(),
    "extratime": extratime!.toJson(),
    "penalty": penalty!.toJson(),
  };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
