class filmResponse {
  filmResponse({
    required this.count,
     this.next,
     this.previous,
    required this.results,
  });
  late final int count;
  late final Null next;
  late final Null previous;
  late final List<Films> results;
  
  filmResponse.fromJson(Map<String, dynamic> json){
    count = json['count'];
    next = null;
    previous = null;
    results = List.from(json['results']).map((e)=>Films.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['count'] = count;
    _data['next'] = next;
    _data['previous'] = previous;
    _data['results'] = results.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Films {
  Films({
    required this.title,
    required this.episodeId,
    required this.openingCrawl,
    required this.director,
    required this.producer,
    required this.releaseDate,
    required this.characters,
    required this.planets,
    required this.starships,
    required this.vehicles,
    required this.species,
    required this.created,
    required this.edited,
    required this.url,
  });
  late final String title;
  late final int episodeId;
  late final String openingCrawl;
  late final String director;
  late final String producer;
  late final String releaseDate;
  late final List<String> characters;
  late final List<String> planets;
  late final List<String> starships;
  late final List<String> vehicles;
  late final List<String> species;
  late final String created;
  late final String edited;
  late final String url;
  
  Films.fromJson(Map<String, dynamic> json){
    title = json['title'];
    episodeId = json['episode_id'];
    openingCrawl = json['opening_crawl'];
    director = json['director'];
    producer = json['producer'];
    releaseDate = json['release_date'];
    characters = List.castFrom<dynamic, String>(json['characters']);
    planets = List.castFrom<dynamic, String>(json['planets']);
    starships = List.castFrom<dynamic, String>(json['starships']);
    vehicles = List.castFrom<dynamic, String>(json['vehicles']);
    species = List.castFrom<dynamic, String>(json['species']);
    created = json['created'];
    edited = json['edited'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['title'] = title;
    _data['episode_id'] = episodeId;
    _data['opening_crawl'] = openingCrawl;
    _data['director'] = director;
    _data['producer'] = producer;
    _data['release_date'] = releaseDate;
    _data['characters'] = characters;
    _data['planets'] = planets;
    _data['starships'] = starships;
    _data['vehicles'] = vehicles;
    _data['species'] = species;
    _data['created'] = created;
    _data['edited'] = edited;
    _data['url'] = url;
    return _data;
  }
}