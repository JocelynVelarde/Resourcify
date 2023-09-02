import 'package:flutter/material.dart';

class LightBulbPage extends StatefulWidget {
  const LightBulbPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _LightBulbPageState createState() => _LightBulbPageState();
}

class _LightBulbPageState extends State<LightBulbPage> {
  bool isLightOn = false;
  bool isCircledLoading = false;

  void _turnOnLight() {
    setState(() {
      isCircledLoading = true;
    });

    // Simulate loading for 5 seconds
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        isLightOn = true;
        isCircledLoading = false;
      });

      _showAlertDialog();
    });
  }

  void _showAlertDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Dispositivo conectado!'),
          content: const Text("Tu dispositivo se ha sincronizado correctamente"),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop(); // Close the AlertDialog
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sync con dispositivo'),
        
    
        
        
        
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              isLightOn ? 'assets/light-bulb-on.png' : 'assets/light-bulb-off.png',
              width: 200, // Adjust the size as needed
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: isCircledLoading ? null : _turnOnLight,
              child: const Text('Conectar'),
            ),
            const SizedBox(height: 20),
            isCircledLoading
                ? const CircularProgressIndicator()
                : const SizedBox(), // Show loading circle when loading
          ],
        ),
      ),
    );
  }
}
