class WeatherModel {
  WeatherModel({
    required this.location,
    required this.current,
  });

  final Location? location;
  final WeatherDataModel? current;

  factory WeatherModel.fromJson(Map<String, dynamic> json){
    return WeatherModel(
      location: json["location"] == null ? null : Location.fromJson(json["location"]),
      current: json["current"] == null ? null : WeatherDataModel.fromJson(json["current"]),
    );
  }

  Map<String, dynamic> toJson() => {
    "location": location?.toJson(),
    "current": current?.toJson(),
  };

}

class WeatherDataModel {
  WeatherDataModel({
    required this.lastUpdatedEpoch,
    required this.lastUpdated,
    required this.tempC,
    required this.tempF,
    required this.isDay,
    required this.condition,
    required this.windMph,
    required this.windKph,
    required this.windDegree,
    required this.windDir,
    required this.pressureMb,
    required this.pressureIn,
    required this.precipMm,
    required this.precipIn,
    required this.humidity,
    required this.cloud,
    required this.feelslikeC,
    required this.feelslikeF,
    required this.visKm,
    required this.visMiles,
    required this.uv,
    required this.gustMph,
    required this.gustKph,
  });

  final int lastUpdatedEpoch;
  final String lastUpdated;
  final int tempC;
  final double tempF;
  final int isDay;
  final Condition? condition;
  final double windMph;
  final double windKph;
  final int windDegree;
  final String windDir;
  final int pressureMb;
  final double pressureIn;
  final double precipMm;
  final double precipIn;
  final int humidity;
  final int cloud;
  final double feelslikeC;
  final double feelslikeF;
  final int visKm;
  final int visMiles;
  final int uv;
  final double gustMph;
  final double gustKph;

  factory WeatherDataModel.fromJson(Map<String, dynamic> json){
    return WeatherDataModel(
      lastUpdatedEpoch: json["last_updated_epoch"] ?? 0,
      lastUpdated: json["last_updated"] ?? "",
      tempC: json["temp_c"] ?? 0,
      tempF: json["temp_f"] ?? 0.toDouble(),
      isDay: json["is_day"] ?? 0,
      condition: json["condition"] == null ? null : Condition.fromJson(json["condition"]),
      windMph: json["wind_mph"] ?? 0.toDouble(),
      windKph: json["wind_kph"] ?? 0.toDouble(),
      windDegree: json["wind_degree"] ?? 0,
      windDir: json["wind_dir"] ?? "",
      pressureMb: json["pressure_mb"] ?? 0,
      pressureIn: json["pressure_in"] ?? 0.toDouble(),
      precipMm: json["precip_mm"] ?? 0.toDouble(),
      precipIn: json["precip_in"] ?? 0.toDouble(),
      humidity: json["humidity"] ?? 0,
      cloud: json["cloud"] ?? 0,
      feelslikeC: json["feelslike_c"] ?? 0.toDouble(),
      feelslikeF: json["feelslike_f"] ?? 0.toDouble(),
      visKm: json["vis_km"] ?? 0,
      visMiles: json["vis_miles"] ?? 0,
      uv: json["uv"] ?? 0,
      gustMph: json["gust_mph"] ?? 0.toDouble(),
      gustKph: json["gust_kph"] ?? 0.toDouble(),
    );
  }

  Map<String, dynamic> toJson() => {
    "last_updated_epoch": lastUpdatedEpoch,
    "last_updated": lastUpdated,
    "temp_c": tempC,
    "temp_f": tempF,
    "is_day": isDay,
    "condition": condition?.toJson(),
    "wind_mph": windMph,
    "wind_kph": windKph,
    "wind_degree": windDegree,
    "wind_dir": windDir,
    "pressure_mb": pressureMb,
    "pressure_in": pressureIn,
    "precip_mm": precipMm,
    "precip_in": precipIn,
    "humidity": humidity,
    "cloud": cloud,
    "feelslike_c": feelslikeC,
    "feelslike_f": feelslikeF,
    "vis_km": visKm,
    "vis_miles": visMiles,
    "uv": uv,
    "gust_mph": gustMph,
    "gust_kph": gustKph,
  };

}

class Condition {
  Condition({
    required this.text,
    required this.icon,
    required this.code,
  });

  final String text;
  final String icon;
  final int code;

  factory Condition.fromJson(Map<String, dynamic> json){
    return Condition(
      text: json["text"] ?? "",
      icon: json["icon"] ?? "",
      code: json["code"] ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
    "text": text,
    "icon": icon,
    "code": code,
  };

}

class Location {
  Location({
    required this.name,
    required this.region,
    required this.country,
    required this.lat,
    required this.lon,
    required this.tzId,
    required this.localtimeEpoch,
    required this.localtime,
  });

  final String name;
  final String region;
  final String country;
  final double lat;
  final double lon;
  final String tzId;
  final int localtimeEpoch;
  final String localtime;

  factory Location.fromJson(Map<String, dynamic> json){
    return Location(
      name: json["name"] ?? "",
      region: json["region"] ?? "",
      country: json["country"] ?? "",
      lat: json["lat"] ?? 0.toDouble(),
      lon: json["lon"] ?? 0.toDouble(),
      tzId: json["tz_id"] ?? "",
      localtimeEpoch: json["localtime_epoch"] ?? 0,
      localtime: json["localtime"] ?? "",
    );
  }

  Map<String, dynamic> toJson() => {
    "name": name,
    "region": region,
    "country": country,
    "lat": lat,
    "lon": lon,
    "tz_id": tzId,
    "localtime_epoch": localtimeEpoch,
    "localtime": localtime,
  };

}