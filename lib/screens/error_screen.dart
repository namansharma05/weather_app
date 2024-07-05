import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 66, 66),
      ),
      backgroundColor: const Color.fromARGB(255, 255, 66, 66),
      body: Container(
        margin: EdgeInsets.only(
          left: 20,
          right: 5,
        ),
        child: RichText(
          text: TextSpan(
              text: 'There is a problem while fetching the Data.',
              style: TextStyle(
                fontSize: 36,
                color: Colors.white,
              ),
              children: [
                TextSpan(
                  text: 'Make sure you are Entring the correct location.',
                  style: TextStyle(
                      fontSize: 36,
                      color: Colors.white54,
                      fontWeight: FontWeight.w600),
                )
              ]),
        ),
      ),
    );
  }
}
