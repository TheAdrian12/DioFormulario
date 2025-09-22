import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 70,
              height: 70,
              child: CircularProgressIndicator(
                backgroundColor: Colors.black,
                strokeWidth: 8,
              ),
            ),
            SizedBox(height: 12),
            Text('Loading', style: TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }
}
