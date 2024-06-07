import 'package:flutter/material.dart';

class TelaLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/image/logo.png',
          fit: BoxFit.cover,
          ),
          ElevatedButton (style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
            onPressed: () {
            },
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.email_outlined, color: Colors.white),
                SizedBox(width: 8),
                Text('Continuar com o Email', style: TextStyle(color: Colors.white)),
              ],
            )
          ),
        ]
      ),
    );
  }
}