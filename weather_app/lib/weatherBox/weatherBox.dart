/**
 * weatherBox.dart
 * 
 * Contains a simple, re-usable, scalable weather box component. Displays 
 * helpful, short, clear, and concise weather information. The goal is to be
 * able to quickly glance at this component and capture the majority of its
 * information.
 * 
 * Note: the main temperature pulled is the <b>average temperature</b>.
 */

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../types/tomorrowData/tomorrowData.dart';
import '../config/config.dart';

class WeatherBox extends StatefulWidget {
  WeatherBox({super.key, required this.theWeatherData, required this.dayIndex});

  // late final List<TomorrowData>? theWeatherData;
  late final List<TomorrowData>? theWeatherData;

  // dayIndex determines which day of the forecast this component displays.
  // 0 is today. 1 is tomorrow. etc.
  final int dayIndex;

  @override
  State<WeatherBox> createState() => _WeatherBoxState();
}

class _WeatherBoxState extends State<WeatherBox> {

  // animatedOpacityValue is used to apply a fade-in effect on this component.
  double animatedOpacityValue = 0.0;

  var myTopColor = Colors.green.shade50;
  late var nowDayAndTimeHumanReadable;
  var myMainWeatherIconBasedOnWeather = const Icon(
    Icons.sunny,
    color: Colors.yellow,
    size: 90,
  );

  String? myWeatherDescriptionText = 'Sunny';

  List<Widget> lowerGridWidgets = [];

  // C = (5/9) * (F - 32)
  double convertCelsiusToFahrenheit(double? celsiusDbl) {
    return celsiusDbl != null ? (celsiusDbl * 9 / 5 + 32).round() as double : 0;
  }

  // setLowerGridValues sets the data used in the grid widget iteration.
  // Here we generate the widgets we need to display for each grid.
  void setLowerGridValues() {
    
    lowerGridWidgets.add(Tooltip(
      message: 'Temperature Apparent Avg.',
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(Icons.sunny, color: Colors.grey.shade300, size: 50),
          Text('${widget.theWeatherData?[widget.dayIndex].temperatureApparentAvg}', style: TextStyle(color: Colors.grey.shade500, )),
        ],
      ),
    ));

    lowerGridWidgets.add(Tooltip(
      message: 'Rain Accumulation Avg.',
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(Icons.water_drop, color: Colors.grey.shade300, size: 50),
          Text('${widget.theWeatherData?[widget.dayIndex].rainAccumulationAvg}', style: TextStyle(color: Colors.grey.shade500, )),
        ],
      ),
    ));

    lowerGridWidgets.add(Tooltip(
      message: 'Cloud Coverage Avg.',
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(Icons.cloud, color: Colors.grey.shade300, size: 50),
          Text('${widget.theWeatherData?[widget.dayIndex].cloudCoverAvg}', style: TextStyle(color: Colors.grey.shade500, )),
        ],
      ),
    ));

    lowerGridWidgets.add(Tooltip(
      message: 'Visibility Avg.',
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(Icons.face, color: Colors.grey.shade300, size: 50),
          Text('${widget.theWeatherData?[widget.dayIndex].visibilityAvg}', style: TextStyle(color: Colors.grey.shade500, )),
        ],
      ),
    ));

    lowerGridWidgets.add(Tooltip(
      message: 'Wind Gust Avg.',
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(Icons.wind_power, color: Colors.grey.shade300, size: 50),
          Text('${widget.theWeatherData?[widget.dayIndex].windGustAvg}', style: TextStyle(color: Colors.grey.shade500, )),
        ],
      ),
    ));

    lowerGridWidgets.add(Tooltip(
      message: 'Evapo. Transpiration Avg.',
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(Icons.invert_colors, color: Colors.grey.shade300, size: 50),
          Text('${widget.theWeatherData?[widget.dayIndex].evapotranspirationAvg}', style: TextStyle(color: Colors.grey.shade500, )),
        ],
      ),
    ));

    lowerGridWidgets.add(Tooltip(
      message: 'Ice Accumulation Avg.',
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(Icons.ice_skating_rounded, color: Colors.grey.shade300, size: 50),
          Text('${widget.theWeatherData?[widget.dayIndex].iceAccumulationAvg}', style: TextStyle(color: Colors.grey.shade500, )),
        ],
      ),
    ));

    lowerGridWidgets.add(Tooltip(
      message: 'Snow Accumulation Avg.',
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(Icons.water, color: Colors.grey.shade300, size: 50),
          Text('${widget.theWeatherData?[widget.dayIndex].snowAccumulationAvg}', style: TextStyle(color: Colors.grey.shade500, )),
        ],
      ),
    ));

    dynamic snowDepth__handleNullExample = widget.theWeatherData?[widget.dayIndex].snowDepthAvg != null ? (widget.theWeatherData?[widget.dayIndex].snowDepthAvg) : 'N/A';
    lowerGridWidgets.add(Tooltip(
      message: 'Snow Depth Avg.',
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(Icons.cloudy_snowing, color: Colors.grey.shade300, size: 50),
          Text('${snowDepth__handleNullExample}', style: TextStyle(color: Colors.grey.shade500, )),
        ],
      ),
    ));

    lowerGridWidgets.add(Tooltip(
      message: 'Sleet Accumulation Avg.',
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(Icons.snowing, color: Colors.grey.shade300, size: 50),
          Text('${widget.theWeatherData?[widget.dayIndex].sleetAccumulationAvg}', style: TextStyle(color: Colors.grey.shade500, )),
        ],
      ),
    ));

    lowerGridWidgets.add(Tooltip(
      message: 'Temperature Apparent Avg.',
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(Icons.wb_sunny_outlined, color: Colors.grey.shade300, size: 50),
          Text('${widget.theWeatherData?[widget.dayIndex].temperatureApparentAvg}', style: TextStyle(color: Colors.grey.shade500, )),
        ],
      ),
    ));
    
    lowerGridWidgets.add(Tooltip(
      message: 'Dew Point Avg.',
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(Icons.dew_point, color: Colors.grey.shade300, size: 50),
          Text('${widget.theWeatherData?[widget.dayIndex].dewPointAvg}', style: TextStyle(color: Colors.grey.shade500, )),
        ],
      ),
    ));

  }
  
  // setMyTopColor sets the color of the top-most part of the component.
  // This is purely aesthetic, however I believe it adds to the look-and-feel.
  void setMyTopColor() {
    if(widget.dayIndex == 0) {
      myTopColor = Colors.green.shade50;
    } else if(widget.dayIndex == 1) {
      myTopColor = Colors.cyan.shade50;
    } else if(widget.dayIndex == 2) {
      myTopColor = Colors.yellow.shade50;
    } else if(widget.dayIndex == 3) {
      myTopColor = Colors.purple.shade50;
    } else if(widget.dayIndex == 4) {
      myTopColor = Colors.red.shade50;
    } else if(widget.dayIndex == 5) {
      myTopColor = Colors.blue.shade50;
    }
  }

  // setWeatherIcon sets the primary icon and weather description.
  // https://docs.tomorrow.io/reference/climate-normals
  // weather code: https://docs.tomorrow.io/reference/data-layers-weather-codes
  void setWeatherIcon() {
    
    // Set weather description text. (over-simplification, but good enough 
    // for now).
    // Ordering is important in this case.
    myWeatherDescriptionText = TomorrowAPIInfo.WEATHER_FULL_DAY_MESSAGE[
      '${widget.theWeatherData?[widget.dayIndex].weatherCodeMax}'
    ];

    // Determine the icon based on weather description text (works for now).
    if(myWeatherDescriptionText?.contains('Thunder') == true) {
      myMainWeatherIconBasedOnWeather = Icon(
        Icons.thunderstorm,
        color: Colors.blue,
        size: 90,
      );
    }

    else if(myWeatherDescriptionText?.contains('Rain') == true
         || myWeatherDescriptionText?.contains('Flur') == true
         || myWeatherDescriptionText?.contains('Driz') == true) {
      myMainWeatherIconBasedOnWeather = const Icon(
        Icons.water_drop,
        color: Colors.blue,
        size: 90,
      );
    } 

    else if(myWeatherDescriptionText?.contains('Snow') == true 
         || myWeatherDescriptionText?.contains('Ice') == true) {
      myMainWeatherIconBasedOnWeather = Icon(
        Icons.cloudy_snowing,
        color: Colors.grey.shade100, 
        size: 90,
      );
    } 

    else if(myWeatherDescriptionText?.contains('Cloud') == true) {
      myMainWeatherIconBasedOnWeather = const Icon(
        Icons.cloud,
        color: Colors.grey,
        size: 90,
      );
    } 

    else if(myWeatherDescriptionText?.contains('Fog') == true) {
      myMainWeatherIconBasedOnWeather = Icon(
        Icons.foggy,
        color: Colors.grey,
        size: 90,
      );
    }

    // else if(myWeatherDescriptionText.contains('more_sweet_icons...') == true) {
    //   myMainWeatherIconBasedOnWeather = const Icon(
    //     Icons.sunny,
    //     color: Colors.yellow,
    //     size: 90,
    //   );
    // }
    
  }

  // setProperDate ensures our forecast components display the correct date
  // in the future.
  void setProperDate() {
    DateTime _tempTargetDate = DateTime.now();
    for (int i = 0; i < widget.dayIndex; i++) {
      _tempTargetDate = _tempTargetDate.add(Duration(days: 1));
    }
    nowDayAndTimeHumanReadable = DateFormat('MMMMEEEEd').format(_tempTargetDate);
  }

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(milliseconds: 300), () {
      animatedOpacityValue = 1;
      setState(() {});
    });

    // Setup
    setMyTopColor();
    setWeatherIcon();
    setLowerGridValues();
    setProperDate();
  }
  @override
  Widget build(BuildContext context) {

    // AnimatedOpacity we use an Flutter Animated Widget to produce a neat 
    // fade-in effect. I love CSS animations and transitions, so this is 
    // perfect.
    return new AnimatedOpacity(
      opacity: animatedOpacityValue,
      duration: Duration(milliseconds: 500 + (500 * widget.dayIndex)),
      child: Container(
        // padding: EdgeInsets.all(6),
        // color: Colors.white,
        height: 400,
        width: 800,
        margin: const EdgeInsets.only(top: 50, bottom: 50, ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          // color: (widget.dayIndex % 2 == 0) ? Colors.white : const Color.fromARGB(255, 252, 252, 252),
          color: Colors.white,
          border: Border(
            top: BorderSide(color: Colors.grey.shade300),
            left: BorderSide(color: Colors.grey.shade300),
            right: BorderSide(color: Colors.grey.shade300),
            bottom: BorderSide(color: Colors.grey.shade300),
          ),
        ),

        // Divide into top info section and bottom data section
        child: Column(
          children: <Widget>[

            // Current day top-centered text
            Container(
              decoration: BoxDecoration(
                color: myTopColor,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
              ),
              child: SizedBox(
                height: 14,
                child: Center(
                  child: Text(
                    '${DateFormat('EEEE').format( DateTime.parse( widget.theWeatherData?[widget.dayIndex].time as String ) )}${widget.dayIndex != 0 ? '' : ' (Today)'}',
                    style: TextStyle(fontSize: 10,),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),

            // Upper main information row
            Expanded(
              child: Row(
                children: <Widget>[

                  // Weather icon
                  SizedBox(width: 9),
                  myMainWeatherIconBasedOnWeather,
                  SizedBox(width: 10),

                  // Temperature text
                  Text(
                    '${ convertCelsiusToFahrenheit(widget.theWeatherData?[widget.dayIndex].temperatureAvg)} °F', 
                    style: TextStyle(color: Colors.black, fontSize: 70),
                  ),
                  SizedBox(width: 14),

                  // Precip text group
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      SizedBox(height: 17),
                      Text(
                        'Precipitation: ${widget.theWeatherData?[widget.dayIndex].precipitationProbabilityAvg}%', 
                        style: TextStyle(color: Colors.grey[600], fontSize: 16, ),
                      ),
                      Text(
                        'Humidity: ${widget.theWeatherData?[widget.dayIndex].humidityAvg}%', 
                        style: TextStyle(color: Colors.grey[600], fontSize: 16, ),
                      ),
                      Text(
                        'Wind: ${widget.theWeatherData?[widget.dayIndex].windSpeedAvg} mph', 
                        style: TextStyle(color: Colors.grey[600], fontSize: 16, ),
                      ),
                    ],
                  ),

                  Spacer(),

                  // Right-hand Weather text group
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      SizedBox(height: 17),
                      Text(
                        'Weather', 
                        style: TextStyle(color: Colors.grey[900], fontWeight: FontWeight.w700, fontSize: 16, ),
                        textAlign: TextAlign.right,
                      ),
                      Text(
                        nowDayAndTimeHumanReadable, 
                        style: TextStyle(color: Colors.grey[600], fontSize: 16, ),
                        textAlign: TextAlign.right,
                      ),
                      Text(
                        '${myWeatherDescriptionText}', 
                        style: TextStyle(color: Colors.grey[600], fontSize: 16, ),
                        textAlign: TextAlign.right,
                      ),
                    ],
                  ),

                  SizedBox(width: 9),
                ]
              ),
            ),

            // Bottom grid extra information row
            SizedBox(
              height: 275,
              child: GridView.count(
                crossAxisCount: 6,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children: List.generate(12, (index) {
                  return Container(
                    decoration: BoxDecoration(
                      // borderRadius: BorderRadius.circular(10),
                      // color: Corlors.white,
                      border: Border(
                        top: index > 5 ? BorderSide(color: Colors.grey.shade100) : BorderSide(color: Colors.transparent),
                        left: BorderSide(color: Colors.grey.shade100),
                        right: BorderSide(color: Colors.grey.shade100),
                        // bottom: index < 6 ? BorderSide(color: Colors.grey.shade100) : BorderSide(color: Colors.transparent),
                      ),
                    ),
                    child: lowerGridWidgets[index],
                  );
                }),
              ),
            ),

          ], // <Widget>[]
        ),
      ), // Container
    );
  } // Widget build
} // Class
