import 'package:flutter/material.dart';

class NavBarWidget extends StatelessWidget {
  final VoidCallback onButton1Pressed;
  final VoidCallback onButton2Pressed;

  NavBarWidget({
    required this.onButton1Pressed,
    required this.onButton2Pressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.0,
      color: Colors.blue, // Customize the background color
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            onPressed: onButton1Pressed,
            child: Text(
              'Button 1', // Customize the text
              style: TextStyle(
                color: Colors.white, // Customize the text color
                fontSize: 16.0, // Customize the font size
              ),
            ),
          ),
          SizedBox(width: 20.0), // Add space between buttons
          TextButton(
            onPressed: onButton2Pressed,
            child: Text(
              'Button 2', // Customize the text
              style: TextStyle(
                color: Colors.white, // Customize the text color
                fontSize: 16.0, // Customize the font size
              ),
            ),
          ),
        ],
      ),
    );
  }
}
