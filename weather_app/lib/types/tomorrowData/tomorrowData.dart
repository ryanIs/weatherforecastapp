/**
 * tomorrowData.dart
 * 
 * tomorrowData is a special object type that contains the maximum amount of 
 * variables reported from the tomorrow.io API (e.g. temperature, humityAvg, 
 * iceAccumulationAvg, etc.). (daily object has most and is the gold standard.)
 */

// import '../../config/config.dart';

/**
 * TomorrowData
 * 
 * Object type for all tomorrow.io retrieved data.
 * Includes latitude and longitude values for the "location" data.
 */
class TomorrowData {

  // Main data
  final double? cloudBaseAvg;
  final double? cloudBaseMax;
  final double? cloudBaseMin;
  final double? cloudCeilingAvg;
  final double? cloudCeilingMax;
  final double? cloudCeilingMin;
  final double? cloudCoverAvg;
  final double? cloudCoverMax;
  final double? cloudCoverMin;
  final double? dewPointAvg;
  final double? dewPointMax;
  final double? dewPointMin;
  final double? evapotranspirationAvg;
  final double? evapotranspirationMax;
  final double? evapotranspirationMin;
  final double? evapotranspirationSum;
  final double? freezingRainIntensityAvg;
  final double? freezingRainIntensityMax;
  final double? freezingRainIntensityMin;
  final double? humidityAvg;
  final double? humidityMax;
  final double? humidityMin;
  final double? iceAccumulationAvg;
  final double? iceAccumulationLweAvg;
  final double? iceAccumulationLweMax;
  final double? iceAccumulationLweMin;
  final double? iceAccumulationLweSum;
  final double? iceAccumulationMax;
  final double? iceAccumulationMin;
  final double? iceAccumulationSum;
  final String? moonriseTime;
  final String? moonsetTime;
  final double? precipitationProbabilityAvg;
  final double? precipitationProbabilityMax;
  final double? precipitationProbabilityMin;
  final double? pressureSurfaceLevelAvg;
  final double? pressureSurfaceLevelMax;
  final double? pressureSurfaceLevelMin;
  final double? rainAccumulationAvg;
  final double? rainAccumulationLweAvg;
  final double? rainAccumulationLweMax;
  final double? rainAccumulationLweMin;
  final double? rainAccumulationMax;
  final double? rainAccumulationMin;
  final double? rainAccumulationSum;
  final double? rainIntensityAvg;
  final double? rainIntensityMax;
  final double? rainIntensityMin;
  final double? sleetAccumulationAvg;
  final double? sleetAccumulationLweAvg;
  final double? sleetAccumulationLweMax;
  final double? sleetAccumulationLweMin;
  final double? sleetAccumulationLweSum;
  final double? sleetAccumulationMax;
  final double? sleetAccumulationMin;
  final double? sleetIntensityAvg;
  final double? sleetIntensityMax;
  final double? sleetIntensityMin;
  final double? snowAccumulationAvg;
  final double? snowAccumulationLweAvg;
  final double? snowAccumulationLweMax;
  final double? snowAccumulationLweMin;
  final double? snowAccumulationLweSum;
  final double? snowAccumulationMax;
  final double? snowAccumulationMin;
  final double? snowAccumulationSum;
  final double? snowDepthAvg;
  final double? snowDepthMax;
  final double? snowDepthMin;
  final double? snowDepthSum;
  final double? snowIntensityAvg;
  final double? snowIntensityMax;
  final double? snowIntensityMin;
  final String? sunriseTime;
  final String? sunsetTime;
  final double? temperatureApparentAvg;
  final double? temperatureApparentMax;
  final double? temperatureApparentMin;
  final double? temperatureAvg;
  final double? temperatureMax;
  final double? temperatureMin;
  final double? uvHealthConcernAvg;
  final double? uvHealthConcernMax;
  final double? uvHealthConcernMin;
  final double? uvIndexAvg;
  final double? uvIndexMax;
  final double? uvIndexMin;
  final double? visibilityAvg;
  final double? visibilityMax;
  final double? visibilityMin;
  final double? weatherCodeMax;
  final double? weatherCodeMin;
  final double? windDirectionAvg;
  final double? windGustAvg;
  final double? windGustMax;
  final double? windGustMin;
  final double? windSpeedAvg;
  final double? windSpeedMax;
  final double? windSpeedMin;
  final String? time;
  final double? lat;
  final double? lon;

  const TomorrowData({
    required this.lat,
    required this.lon,
    required this.time,
    required this.cloudBaseAvg,
    required this.cloudBaseMax,
    required this.cloudBaseMin,
    required this.cloudCeilingAvg,
    required this.cloudCeilingMax,
    required this.cloudCeilingMin,
    required this.cloudCoverAvg,
    required this.cloudCoverMax,
    required this.cloudCoverMin,
    required this.dewPointAvg,
    required this.dewPointMax,
    required this.dewPointMin,
    required this.evapotranspirationAvg,
    required this.evapotranspirationMax,
    required this.evapotranspirationMin,
    required this.evapotranspirationSum,
    required this.freezingRainIntensityAvg,
    required this.freezingRainIntensityMax,
    required this.freezingRainIntensityMin,
    required this.humidityAvg,
    required this.humidityMax,
    required this.humidityMin,
    required this.iceAccumulationAvg,
    required this.iceAccumulationLweAvg,
    required this.iceAccumulationLweMax,
    required this.iceAccumulationLweMin,
    required this.iceAccumulationLweSum,
    required this.iceAccumulationMax,
    required this.iceAccumulationMin,
    required this.iceAccumulationSum,
    required this.moonriseTime,
    required this.moonsetTime,
    required this.precipitationProbabilityAvg,
    required this.precipitationProbabilityMax,
    required this.precipitationProbabilityMin,
    required this.pressureSurfaceLevelAvg,
    required this.pressureSurfaceLevelMax,
    required this.pressureSurfaceLevelMin,
    required this.rainAccumulationAvg,
    required this.rainAccumulationLweAvg,
    required this.rainAccumulationLweMax,
    required this.rainAccumulationLweMin,
    required this.rainAccumulationMax,
    required this.rainAccumulationMin,
    required this.rainAccumulationSum,
    required this.rainIntensityAvg,
    required this.rainIntensityMax,
    required this.rainIntensityMin,
    required this.sleetAccumulationAvg,
    required this.sleetAccumulationLweAvg,
    required this.sleetAccumulationLweMax,
    required this.sleetAccumulationLweMin,
    required this.sleetAccumulationLweSum,
    required this.sleetAccumulationMax,
    required this.sleetAccumulationMin,
    required this.sleetIntensityAvg,
    required this.sleetIntensityMax,
    required this.sleetIntensityMin,
    required this.snowAccumulationAvg,
    required this.snowAccumulationLweAvg,
    required this.snowAccumulationLweMax,
    required this.snowAccumulationLweMin,
    required this.snowAccumulationLweSum,
    required this.snowAccumulationMax,
    required this.snowAccumulationMin,
    required this.snowAccumulationSum,
    required this.snowDepthAvg,
    required this.snowDepthMax,
    required this.snowDepthMin,
    required this.snowDepthSum,
    required this.snowIntensityAvg,
    required this.snowIntensityMax,
    required this.snowIntensityMin,
    required this.sunriseTime,
    required this.sunsetTime,
    required this.temperatureApparentAvg,
    required this.temperatureApparentMax,
    required this.temperatureApparentMin,
    required this.temperatureAvg,
    required this.temperatureMax,
    required this.temperatureMin,
    required this.uvHealthConcernAvg,
    required this.uvHealthConcernMax,
    required this.uvHealthConcernMin,
    required this.uvIndexAvg,
    required this.uvIndexMax,
    required this.uvIndexMin,
    required this.visibilityAvg,
    required this.visibilityMax,
    required this.visibilityMin,
    required this.weatherCodeMax,
    required this.weatherCodeMin,
    required this.windDirectionAvg,
    required this.windGustAvg,
    required this.windGustMax,
    required this.windGustMin,
    required this.windSpeedAvg,
    required this.windSpeedMax,
    required this.windSpeedMin,
  });

  /**
   * fromJSON
   * 
   * Factory constructor that returns our fetched JSON data as an 
   * acceptable Dart Object.
   * 
   * Uses switch expression (produces value based on MATCHed cases)
   * https://dart.dev/language/branches
   */
  factory TomorrowData.fromJSON(Map<String, dynamic> json) => TomorrowData(
    lat: json['lat'] != null ? json['lat'] : 0,
    lon: json['lon'] != null ? json['lon'] : 0,
    time: json['time'] != null ? json['time'] : '',
    cloudBaseAvg: json['values']['cloudBaseAvg'],
    cloudBaseMax: json['values']['cloudBaseMax'],
    cloudBaseMin: json['values']['cloudBaseMin'],
    cloudCeilingAvg: json['values']['cloudCeilingAvg'],
    cloudCeilingMax: json['values']['cloudCeilingMax'],
    cloudCeilingMin: json['values']['cloudCeilingMin'],
    cloudCoverAvg: json['values']['cloudCoverAvg'],
    cloudCoverMax: json['values']['cloudCoverMax'],
    cloudCoverMin: json['values']['cloudCoverMin'],
    dewPointAvg: json['values']['dewPointAvg'],
    dewPointMax: json['values']['dewPointMax'],
    dewPointMin: json['values']['dewPointMin'],
    evapotranspirationAvg: json['values']['evapotranspirationAvg'],
    evapotranspirationMax: json['values']['evapotranspirationMax'],
    evapotranspirationMin: json['values']['evapotranspirationMin'],
    evapotranspirationSum: json['values']['evapotranspirationSum'],
    freezingRainIntensityAvg: json['values']['freezingRainIntensityAvg'],
    freezingRainIntensityMax: json['values']['freezingRainIntensityMax'],
    freezingRainIntensityMin: json['values']['freezingRainIntensityMin'],
    humidityAvg: json['values']['humidityAvg'],
    humidityMax: json['values']['humidityMax'],
    humidityMin: json['values']['humidityMin'],
    iceAccumulationAvg: json['values']['iceAccumulationAvg'],
    iceAccumulationLweAvg: json['values']['iceAccumulationLweAvg'],
    iceAccumulationLweMax: json['values']['iceAccumulationLweMax'],
    iceAccumulationLweMin: json['values']['iceAccumulationLweMin'],
    iceAccumulationLweSum: json['values']['iceAccumulationLweSum'],
    iceAccumulationMax: json['values']['iceAccumulationMax'],
    iceAccumulationMin: json['values']['iceAccumulationMin'],
    iceAccumulationSum: json['values']['iceAccumulationSum'],
    moonriseTime: json['values']['moonriseTime'] != null ? json['moonriseTime'] : '',
    moonsetTime: json['values']['moonsetTime'] != null ? json['moonsetTime'] : '',
    precipitationProbabilityAvg: json['values']['precipitationProbabilityAvg'],
    precipitationProbabilityMax: json['values']['precipitationProbabilityMax'],
    precipitationProbabilityMin: json['values']['precipitationProbabilityMin'],
    pressureSurfaceLevelAvg: json['values']['pressureSurfaceLevelAvg'],
    pressureSurfaceLevelMax: json['values']['pressureSurfaceLevelMax'],
    pressureSurfaceLevelMin: json['values']['pressureSurfaceLevelMin'],
    rainAccumulationAvg: json['values']['rainAccumulationAvg'],
    rainAccumulationLweAvg: json['values']['rainAccumulationLweAvg'],
    rainAccumulationLweMax: json['values']['rainAccumulationLweMax'],
    rainAccumulationLweMin: json['values']['rainAccumulationLweMin'],
    rainAccumulationMax: json['values']['rainAccumulationMax'],
    rainAccumulationMin: json['values']['rainAccumulationMin'],
    rainAccumulationSum: json['values']['rainAccumulationSum'],
    rainIntensityAvg: json['values']['rainIntensityAvg'],
    rainIntensityMax: json['values']['rainIntensityMax'],
    rainIntensityMin: json['values']['rainIntensityMin'],
    sleetAccumulationAvg: json['values']['sleetAccumulationAvg'],
    sleetAccumulationLweAvg: json['values']['sleetAccumulationLweAvg'],
    sleetAccumulationLweMax: json['values']['sleetAccumulationLweMax'],
    sleetAccumulationLweMin: json['values']['sleetAccumulationLweMin'],
    sleetAccumulationLweSum: json['values']['sleetAccumulationLweSum'],
    sleetAccumulationMax: json['values']['sleetAccumulationMax'],
    sleetAccumulationMin: json['values']['sleetAccumulationMin'],
    sleetIntensityAvg: json['values']['sleetIntensityAvg'],
    sleetIntensityMax: json['values']['sleetIntensityMax'],
    sleetIntensityMin: json['values']['sleetIntensityMin'],
    snowAccumulationAvg: json['values']['snowAccumulationAvg'],
    snowAccumulationLweAvg: json['values']['snowAccumulationLweAvg'],
    snowAccumulationLweMax: json['values']['snowAccumulationLweMax'],
    snowAccumulationLweMin: json['values']['snowAccumulationLweMin'],
    snowAccumulationLweSum: json['values']['snowAccumulationLweSum'],
    snowAccumulationMax: json['values']['snowAccumulationMax'],
    snowAccumulationMin: json['values']['snowAccumulationMin'],
    snowAccumulationSum: json['values']['snowAccumulationSum'],
    snowDepthAvg: json['values']['snowDepthAvg'],
    snowDepthMax: json['values']['snowDepthMax'],
    snowDepthMin: json['values']['snowDepthMin'],
    snowDepthSum: json['values']['snowDepthSum'],
    snowIntensityAvg: json['values']['snowIntensityAvg'],
    snowIntensityMax: json['values']['snowIntensityMax'],
    snowIntensityMin: json['values']['snowIntensityMin'],
    sunriseTime: json['values']['sunriseTime'] != null ? json['sunriseTime'] : '',
    sunsetTime: json['values']['sunsetTime'] != null ? json['sunsetTime'] : '',
    temperatureApparentAvg: json['values']['temperatureApparentAvg'],
    temperatureApparentMax: json['values']['temperatureApparentMax'],
    temperatureApparentMin: json['values']['temperatureApparentMin'],
    temperatureAvg: json['values']['temperatureAvg'],
    temperatureMax: json['values']['temperatureMax'],
    temperatureMin: json['values']['temperatureMin'],
    uvHealthConcernAvg: json['values']['uvHealthConcernAvg'],
    uvHealthConcernMax: json['values']['uvHealthConcernMax'],
    uvHealthConcernMin: json['values']['uvHealthConcernMin'],
    uvIndexAvg: json['values']['uvIndexAvg'],
    uvIndexMax: json['values']['uvIndexMax'],
    uvIndexMin: json['values']['uvIndexMin'],
    visibilityAvg: json['values']['visibilityAvg'],
    visibilityMax: json['values']['visibilityMax'],
    visibilityMin: json['values']['visibilityMin'],
    weatherCodeMax: json['values']['weatherCodeMax'],
    weatherCodeMin: json['values']['weatherCodeMin'],
    windDirectionAvg: json['values']['windDirectionAvg'],
    windGustAvg: json['values']['windGustAvg'],
    windGustMax: json['values']['windGustMax'],
    windGustMin: json['values']['windGustMin'],
    windSpeedAvg: json['values']['windSpeedAvg'],
    windSpeedMax: json['values']['windSpeedMax'],
    windSpeedMin: json['values']['windSpeedMin'],
  );

}
