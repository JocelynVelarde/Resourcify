import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<Widget> _buildCards() {
    return [
      _buildCard(
        color: Colors.blue,
        text: 'Sync con dispositivo',
      ),
      _buildCard(
        color: Colors.green,
        text: 'Predicción de consumo',
      ),
      _buildCard(
        color: Colors.orange,
        text: 'Reporte diario',
      ),
    ];
  }




  Widget _buildCard({required Color color, required String text}) {
    return Card(
      color: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0), // Esquinas redondeadas
      ),
      child: Center(
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 16,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text('Resourcify'),
        ),
        actions: [
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
      body: Column(
        children: [
          GridView.builder(
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
            ),
            itemCount: 3, // Número de tarjetas
            itemBuilder: (context, index) {
              return _buildCards()[index];
            },
          ),
          SizedBox(height: 20), // Espacio entre las dos filas
          Text(
            'Echale un vistazo!', 
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              
            ),
          ),
          SizedBox(height: 20), // Espacio entre el texto y la segunda fila
          GridView.builder(
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemCount: 2, // Número de nuevos cuadros medianos
            itemBuilder: (context, index) {
              // Aquí puedes construir los cuadros medianos según tus necesidades
              return _buildCard(
                color: Colors.purple, // Personaliza el color
                text: 'Recomendaciones de ahorro', // Personaliza el texto
              );
           
              
            },
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.savings),
            label: 'Plan de ahorro',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.emoji_events),
            label: 'Rewards',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Comparte"),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green,
        onTap: _onItemTapped,
      ),
    );
  }
}
