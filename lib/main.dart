import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WeatherPage(),
    );
  }
}

class WeatherPage extends StatelessWidget {
  const WeatherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],

      body: Column(
        children: [
          const SizedBox(height: 50),

          // TITLE
          const Text(
            "Weather Dashboard",
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 20),

          // MAIN CARD
          Container(
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                // TOP WEATHER INFO
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Icon(Icons.wb_cloudy, size: 80, color: Colors.orange),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "25°C",
                          style: TextStyle(
                              fontSize: 40, fontWeight: FontWeight.bold),
                        ),
                        Text("Cloudy with a chance of sunshine"),
                        Text("London, UK"),
                      ],
                    )
                  ],
                ),

                const SizedBox(height: 20),

                // GRID
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: GridView.count(
                    crossAxisCount: 4,
                    shrinkWrap: true,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    children: const [
                      WeatherBox("10:00", "26°C", Icons.wb_sunny),
                      WeatherBox("11:00", "27°C", Icons.wb_sunny),
                      WeatherBox("12:00", "25°C", Icons.cloud),
                      WeatherBox("13:00", "24°C", Icons.cloud),

                      WeatherBox("14:00", "25°C", Icons.wb_sunny),
                      WeatherBox("15:00", "24°C", Icons.grain),
                      WeatherBox("16:00", "23°C", Icons.cloud),
                      WeatherBox("17:00", "22°C", Icons.grain),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),

      // BOTTOM NAVIGATION
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}

// SMALL BOX WIDGET
class WeatherBox extends StatelessWidget {
  final String time;
  final String temp;
  final IconData icon;

  const WeatherBox(this.time, this.temp, this.icon, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(time),
          const SizedBox(height: 5),
          Icon(icon, color: Colors.orange),
          const SizedBox(height: 5),
          Text(
            temp,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}