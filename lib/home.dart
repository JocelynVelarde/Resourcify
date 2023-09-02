import 'package:flutter/material.dart';
import 'package:flutter_application_1/auth.dart';
import 'package:flutter_application_1/community.dart';
import 'package:flutter_application_1/graphDaily.dart';
import 'package:flutter_application_1/myhome.dart';
import 'package:flutter_application_1/rewards.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      switch (index) {
        case 0:
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ManageHomePage()));
          break;
        case 1:
          // Navigate to 'Rewards' page
          // You can replace 'RewardsPage' with the actual widget for this page
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => RewardsPage()));
          break;
        case 2:
          // Navigate to 'Comparte' page
          // You can replace 'CompartePage' with the actual widget for this page
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => CommunityPage()));
          break;
      }
    });
  }
List<Widget> _buildCards() {
  return [
    _buildCard(
      color: Colors.blue,
      text: 'Tips de ahorro',
      index: 1,
    ),
    _buildCard(
      color: Colors.green,
      text: 'Predicción de consumo',
      index: 2,
    ),
    _buildCard(
      color: Colors.purple, // Change color to purple
      text: 'Mi cuenta', // Change text to "Recomendaciones de Ahorro"
      index: 3, // Update the index if needed
    ),
    _buildCard(
      color: Colors.orange,
      text: 'Mi Inversión', // Change text to "Mi Inversión"
      index: 4, // Update the index if needed
    ),
    _buildCard(color: Colors.red, text: "Sync con dispositivo", index: 5)
  ];
}

Future<void> signOut() async {
  await Auth().signOut();
}


  Widget _buildCard(
      {required Color color, required String text, required int index}) {
    return GestureDetector(
      onTap: () {
        print("HOLA");
        if (index == 1) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const GraphScreen()));
        } else {
          Navigator.push(context,
    MaterialPageRoute(builder: (context) => const GraphScreen()));
        }
      },
      child: Card(
        color: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0), // Rounded borders
        ),
        child: Center(
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.white, // Text color
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEDAE49),
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Text('Resourcify'),
        ),
        actions: [
          IconButton(onPressed: signOut, icon: const Icon(Icons.logout)),
          IconButton(
            icon: const Icon(Icons.home),
            onPressed: () {
              // Handle home button press (e.g., navigate to home page)
            },
          ),

          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // Handle business button press (e.g., navigate to business page)
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            GridView.builder(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              itemCount: 3,
              itemBuilder: (context, index) {
                return _buildCards()[index];
              },
            ),
            SizedBox(height: 20),
            Text(
              'Echale un vistazo!',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            GridView.builder(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: 2,
              itemBuilder: (context, index) {
                return _buildCards(
                 
                )[index+3];
              },
            ),
            SizedBox(height: 20),
            Text(
              'Consumo de Energía por Día (GWh)',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: 3,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      // Handle list item click here
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => GraphScreen()));
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                      decoration: BoxDecoration(
                        color: Colors.white, // Background color
                        borderRadius:
                            BorderRadius.circular(16), // Rounded borders
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: ListTile(
                        leading: Icon(Icons.flash_on), // Electricity ray icon
                        title: Text('Día ${index + 1}'),
                        trailing: Icon(Icons.arrow_forward_ios),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.light),
            label: 'My Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.emoji_events),
            label: 'Rewards',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: "Comparte"),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green,
        onTap: _onItemTapped,
      ),
    );
  }
}
