import 'package:flutter/material.dart';
import 'package:flutter_application_1/widget_tree.dart';

class UserCompanyPage extends StatelessWidget {
  const UserCompanyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 199, 14, 14),
            Color.fromARGB(255, 247, 201, 76)
          ],
          stops: [0, 1],
          begin: AlignmentDirectional(0.87, -1),
          end: AlignmentDirectional(-0.87, 1),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
                const Icon(Icons.energy_savings_leaf, color: Colors.green, size: 150),
              
              const SizedBox(height: 20.0),
              const Text(
                'Bienvenido a la experiencia Resourcify!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 20.0),
              const Text("¿Eres una empresa o un usuario?", style: TextStyle(fontSize: 24.0), textAlign: TextAlign.center),
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const WidgetTree(),
                  ));
                },
                child: const Text('Empresa', style: TextStyle(fontSize: 20.0)),
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const WidgetTree(),
                  ));
                },
                child: const Text('Usuario', style: TextStyle(fontSize: 20)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
