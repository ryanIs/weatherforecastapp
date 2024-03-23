/**
 * main.dart
 * 
 * This is the main dart file that runs our application.
 * 
 * We use FutureBuilder to handle async components (like Svelte async #await
 * https://svelte.dev/repl/08a77ebadefb4420b1629d5ca94852c6?version=3.12.1)!!
 * @link https://api.flutter.dev/flutter/widgets/FutureBuilder-class.html
 */

import 'package:flutter/material.dart';
import '../config/config.dart';
import 'types/tomorrowData/tomorrowData.dart';
import 'weatherBox/weatherBox.dart';
import 'fetch/fetch.dart';

// List of weather data spanning from today to 5 days into the future (haha).
late List<TomorrowData>? theWeatherData;

// dropdownValue contains the full list of states that the front-end may use.
// TomorrowAPIInfo is a configuration class that has helpful data.
String dropdownValue = TomorrowAPIInfo.ALL_STATES_LIST[2];
var myStateDropdownWidget;

// main is our main function. Flutter runs this on initialization.
void main() {
  runApp(const MyWeatherApp());
}

// MyWeatherApp is the primary stateless widget for the app.
// Here, the theme, title, and main components are initialized.
class MyWeatherApp extends StatelessWidget {
  const MyWeatherApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Flutter Weather Forecast App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      home: MyFutureBuilder(title: 'Home'),
      // Alternative, better option - use MaterialPageRoute: 
      //   MaterialPageRoute(builder: (context) => SecondRoute()),

    );
  }
}

// MyFutureBuilder is a stateful widget which displays our front-end data 
// and securely handles the async data.
class MyFutureBuilder extends StatefulWidget {
  const MyFutureBuilder({super.key, required this.title});

  final String title;

  @override
  State<MyFutureBuilder> createState() => _MyFutureBuilderState();
}

// _MyFutureBuilderState contains our top-level Flutter component(s).
// This class is the core part of the application.
class _MyFutureBuilderState extends State<MyFutureBuilder> {
 
  FetchDataFromAPI dataFetcher = FetchDataFromAPI();
  String currentPage = 'home';
  late WeatherBox weatherBox;
  late final Future<List<TomorrowData>> theWeatherData;

  // _homeNavOnPress navigates to the home page.
  void _homeNavOnPress() {
    setState(() {
      currentPage = 'home';
    });
  }
  
  // _forecastNavOnPress navigates to the forecast page.
  void _forecastNavOnPress() {
    setState(() {
      currentPage = 'forecast';
    });
  }

  // performDataFetch utilizes the dataFetcher class to grab the full 
  // weather dataset at once. We process and display in one motion.
  void performDataFetch() {
    theWeatherData = dataFetcher.fetchData('/weather/forecast');
  }

  // initState is a system function that will initialize our state.
  // (similar to React life-cycle hooks, or Svelte onMount().)
  @override
  void initState() {
    super.initState();

    // States dropdown widget (pulling from config).
    // Must be function to ensure it re-renders and updates value on FE.
    // @Unused for now: change manually in code to see different state.
    myStateDropdownWidget = () => DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.green),
      underline: Container(
        height: 1,
        color: Colors.green,
      ),
      onChanged: (String? value) {
        setState(() {
          dropdownValue = value!;
          // performDataFetch();
        });
      },
      items: TomorrowAPIInfo.ALL_STATES_LIST.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }

  // _MyFutureBuilderState is the main constructor. Here we fetch the data.
  _MyFutureBuilderState() {
    performDataFetch();
  }

  // build is a(n) (overridden) system function that will return the primary
  // Scaffold that Flutter (awesomely) uses to render front-end components.
  // We use an encapsulation-first methodology to ensure scalability and 
  // to let future development on this project include more robust features.
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Color.fromRGBO(255 - (currentPage == 'forecast' ? 2 : 0), 255 - (currentPage == 'forecast' ? 2 : 0), 255, 1),
        title: Row(
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.home),
              color: currentPage == 'forecast' ? Colors.grey : Colors.black,
              tooltip: 'View the home page',
              onPressed: _homeNavOnPress,
            ),
            IconButton(
              icon: const Icon(Icons.foggy),
              color: currentPage == 'forecast' ? Colors.black : Colors.grey,
              tooltip: 'View the forecast page',
              onPressed: _forecastNavOnPress,
            ),
          ],
        ),
      ),

      backgroundColor:  Color.fromARGB(255, 248, 248, 248),

      // Using FutureBuilder, we can asynchronously display continous info 
      // for the user (loading, success, failed) so that the most important
      // states of our primary data-fetch Future is accounted for.
      body: FutureBuilder<List<TomorrowData>>(
        future: theWeatherData,

        builder: (BuildContext context, AsyncSnapshot<List<TomorrowData>> snapshot) {
          List<Widget> children;

          // SUCCESS: Our weather app data successfully loaded; display the starter page.
          if (snapshot.hasData) {
            children = currentPage == 'forecast' ? 
              // Forecast view
              <Widget>[
                // Just set state / lat-lon manually for now...
                // SizedBox(height: 40),
                // Text('State:'),
                // myStateDropdownWidget() as Widget,
                ...[0,1,2,3,4,5].map((day) => WeatherBox(theWeatherData: snapshot.data, dayIndex: day)),
              ]
              :
              // Home view
              <Widget>[
                // SizedBox(height: 40),
                // Text('State:'),
                // myStateDropdownWidget() as Widget,
                WeatherBox(theWeatherData: snapshot.data, dayIndex: 0),
              ];
          } 

          // FAILURE: Data errored out! Display/Handle the error.
          else if (snapshot.hasError) {
            children = <Widget>[
              SizedBox(height: 200),
              const Icon(
                Icons.error_outline,
                color: Colors.red,
                size: 60,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                // child: Text('Error: ${snapshot.error}'),
                child: Text('Error: failed to load the weather data.'),
              ),
            ];
          } 

          // LOADING: We are still waiting on data. Spin that circle!
          else {
            children = const <Widget>[
              SizedBox(height: 200),
              SizedBox(
                width: 60,
                height: 60,
                child: CircularProgressIndicator(),
              ),
              Padding(
                padding: EdgeInsets.only(top: 16),
                child: Text('Awaiting result...'),
              ),
            ];
          }

          // Return our children as needed (scrollable).
          return SingleChildScrollView (
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: children,
              ),
            )
          );
          
        }, // builder
      ),
    ); // Scaffold
  }
}
