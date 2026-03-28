import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
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

      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Weather Dashboard",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 20),

              // MAIN CARD
              Container(
                width: 350,
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
                        const Icon(
                          Icons.wb_cloudy,
                          size: 80,
                          color: Colors.orange,
                        ),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "25°C",
                              style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                              ),
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
                        physics: const NeverScrollableScrollPhysics(),
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
        ),
      ),

      // CENTERED BOTTOM NAVIGATION
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            NavItem(icon: Icons.home, label: "Home"),
            SizedBox(width: 30),
            NavItem(icon: Icons.search, label: "Search"),
            SizedBox(width: 30),
            NavItem(icon: Icons.person, label: "Profile"),
          ],
        ),
      ),
    );
  }
}

// WEATHER BOX
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
// CUSTOM NAV ITEM
class NavItem extends StatelessWidget {
  final IconData icon;
  final String label;

  const NavItem({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: Colors.grey[700]),
        Text(
          label,
          style: TextStyle(color: Colors.grey[700]),
        ),
      ],
    );
  }
}