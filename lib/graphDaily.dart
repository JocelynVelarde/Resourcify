import 'package:draw_graph/draw_graph.dart';
import 'package:draw_graph/models/feature.dart';
import 'package:flutter/material.dart';

class GraphScreen extends StatefulWidget {
  const GraphScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _GraphScreenState createState() => _GraphScreenState();
}

class _GraphScreenState extends State<GraphScreen> {
  final List<Feature> features = [
    Feature(
      title: "Lunes",
      color: Colors.blue,
      data: [0.3, 0.6, 0.8, 0.9, 1, 1.2],
    ),
    Feature(
      title: "Martes",
      color: Colors.blue,
      data: [0.3, 0.6, 0.8, 0.9, 1, 1.2],
    ),
    Feature(
      title: "Miercoles",
      color: Colors.black,
      data: [1, 0.8, 0.6, 0.7, 0.3, 0.1],
    ),
    Feature(
      title: "Jueves",
      color: Colors.orange,
      data: [0.4, 0.2, 0.9, 0.5, 0.6, 0.4],
    ),
    Feature(
      title: "Viernes",
      color: Colors.red,
      data: [0.5, 0.2, 0, 0.3, 1, 1.3],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
   title: const Padding(
     padding: EdgeInsets.symmetric(horizontal: 16.0),
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
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Consumo de Energía por día (GWh)",
              textAlign: TextAlign.center,
             
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
              ),
            ),
          ),
          LineGraph(
            features: features,
            size: const Size(420, 450),
            labelX: const [
              'Día 1',
              'Día 2',
              'Día 3',
              'Día 4',
              'Día 5',
              'Día 6'
            ],
            labelY: const ['25%', '45%', '65%', '75%', '85%', '100%'],
            showDescription: true,
            graphColor: Colors.black87,
          ),
          const SizedBox(
            height: 50,
          )
        ],
      ),
    );
  }
}
